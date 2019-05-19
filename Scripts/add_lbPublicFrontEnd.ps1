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
Add-AzLoadBalancerFrontendIpConfig -LoadBalancer $slb -Name $frontEndName -PublicIpAddress $publicIP

$slb | Set-AzLoadBalancer
