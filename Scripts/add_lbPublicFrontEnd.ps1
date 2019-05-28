Param(
    [Parameter(Mandatory = $True)]
    [string]$LBName,
    [Parameter(Mandatory = $True)]
    [string]$RGName,
    [Parameter(Mandatory = $True)]
    [string]$publicIPName,
    [Parameter(Mandatory = $True)]
    [string]$frontEndName
)

$slb = Get-AzLoadBalancer -Name $LBName -ResourceGroupName $RGName    
$publicIP = Get-AzPublicIpAddress -Name $publicIPName -ResourceGroupName $RGName

try{
    Get-AzLoadBalancerFrontendIpConfig -LoadBalancer $slb -Name $frontEndName
    Write-Warning "A frontend config with the name $fronEndName already exists on $lbname"
}
catch {
    Add-AzLoadBalancerFrontendIpConfig -LoadBalancer $slb -Name $frontEndName -PublicIpAddress $publicIP

    $slb | Set-AzLoadBalancer
}