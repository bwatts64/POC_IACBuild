Param(
    [Parameter(Mandatory = $True)]
    [string]$LBName,
    [Parameter(Mandatory = $True)]
    [string]$RGName,
    [Parameter(Mandatory = $True)]
    [string]$protocol,
    [Parameter(Mandatory = $True)]
    [string]$frontEndConfigName,
    [Parameter(Mandatory = $True)]
    [string]$FrontEndPorts,
    [Parameter(Mandatory = $True)]
    [string]$BackEndPort,
    [Parameter(Mandatory = $True)]
    [string]$NatNamePrefix,
    [Parameter(Mandatory = $True)]
    [string]$avSetName,
    [Parameter(Mandatory = $True)]
    [bool]$EnableFloatingIP
)
Start-Sleep -Seconds 15

$slb = Get-AzLoadBalancer -Name $LBName -ResourceGroupName $RGName
$frontEndConfig = Get-AzLoadBalancerFrontendIpConfig -LoadBalancer $slb -Name $frontEndConfigName
[array]$FrontEndPorts = $FrontEndPorts -split ","
$i=1

$avSet = Get-AzAvailabilitySet -Name $avSetName -ResourceGroupName $RGName
foreach($FrontEndPort in $FrontEndPorts) {
    if($EnableFloatingIP) {
        $slb | Add-AzLoadBalancerInboundNatRuleConfig -Name "$NatNamePrefix-$i" -FrontendIpConfiguration $frontEndConfig -FrontendPort $FrontEndPort  -BackendPort $BackEndPort -Protocol $protocol -EnableFloatingIP
    }
    else {
        $slb | Add-AzLoadBalancerInboundNatRuleConfig -Name "$NatNamePrefix-$i" -FrontendIpConfiguration $frontEndConfig -FrontendPort $FrontEndPort  -BackendPort $BackEndPort -Protocol $protocol
    }
    $slb | Set-AzLoadBalancer
    $slb = Get-AzLoadBalancer -Name $LBName -ResourceGroupName $RGName

    $nic = Get-AzNetworkInterface | Where-Object {($_.VirtualMachine -ne $null) -and ($_.VirtualMachine.id).ToLower() -eq ($avSet.VirtualMachinesReferences.id[$i-1]).ToLower()}
    $nic.IpConfigurations[0].LoadBalancerInboundNatRules = $slb.InboundNatRules[$i-1]
    Set-AzNetworkInterface -NetworkInterface $nic
    $i++
    Start-Sleep -Seconds 60
    $slb = Get-AzLoadBalancer -Name $LBName -ResourceGroupName $RGName
}

