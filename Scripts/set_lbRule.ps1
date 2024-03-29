﻿Param(
    [Parameter(Mandatory = $True)]
    [string]$LBName,
    [Parameter(Mandatory = $True)]
    [string]$RGName,
    [Parameter(Mandatory = $True)]
    [string]$RuleName,
    [Parameter(Mandatory = $False)]
    [string]$LoadDistribution,
    [Parameter(Mandatory = $True)]
    [string]$protocol,
    [Parameter(Mandatory = $True)]
    [string]$frontEndConfigName,
    [Parameter(Mandatory = $True)]
    [string]$frontEndPort,
    [Parameter(Mandatory = $True)]
    [string]$backEndPort,
    [Parameter(Mandatory = $True)]
    [bool]$EnableFloatingIP,
    [Parameter(Mandatory = $True)]
    [string]$healthProbeName
)

Start-Sleep -Seconds 120

$slb = Get-AzLoadBalancer -Name $LBName -ResourceGroupName $RGName

$i=0

while((Get-AzLoadBalancer -Name $LBName -ResourceGroupName $RGName).count -eq 0) {
    $frontEndConfig = Get-AzLoadBalancerFrontendIpConfig -LoadBalancer $slb -Name $frontEndConfigName

    $healthProbe = Get-AzLoadBalancerProbeConfig -LoadBalancer $slb -Name $healthProbeName

    if($EnableFloatingIP -eq $true) {
        $slb | Add-AzLoadBalancerRuleConfig -Name $RuleName -Protocol $protocol -FrontendPort $frontEndPort -BackendPort $backEndPort -FrontendIpConfiguration $frontEndConfig -BackendAddressPool $slb.BackendAddressPools[0] -Probe $healthProbe -EnableFloatingIP
    }
    else {
        $slb | Add-AzLoadBalancerRuleConfig -Name $RuleName -Protocol $protocol -FrontendPort $frontEndPort -BackendPort $backEndPort -FrontendIpConfiguration $frontEndConfig -BackendAddressPool $slb.BackendAddressPools[0] -Probe $healthProbe
    }
    $slb | Set-AzLoadBalancer

    Start-Sleep -Seconds 15
    $i++
}