Param(
    [Parameter(Mandatory = $True)]
    [string]$LBName,
    [Parameter(Mandatory = $True)]
    [string]$RGName,
    [Parameter(Mandatory = $True)]
    [string]$ProbeName,
    [Parameter(Mandatory = $False)]
    [string]$RequestPath,
    [Parameter(Mandatory = $True)]
    [string]$protocol,
    [Parameter(Mandatory = $True)]
    [string]$Port,
    [Parameter(Mandatory = $True)]
    [int]$IntervalSeconds,
    [Parameter(Mandatory = $True)]
    [int]$ProbeCount
)

$slb = Get-AzLoadBalancer -Name $LBName -ResourceGroupName $RGName

try{
    Get-AzLoadBalancerProbeConfig -LoadBalancer $slb -Name $ProbeName
    Write-Warning "A probe with name $ProbeName already exist on $lbname"
}
catch {
    if($RequestPath -ne '') {
        $slb | Add-AzLoadBalancerProbeConfig -Name $ProbeName -Protocol $protocol -Port $Port -IntervalInSeconds $IntervalSeconds -ProbeCount $ProbeCount -RequestPath $RequestPath 
    }
    else {
        Write-Host "B"
        $slb | Add-AzLoadBalancerProbeConfig -Name $ProbeName -Protocol $protocol -Port $Port -IntervalInSeconds $IntervalSeconds -ProbeCount $ProbeCount -RequestPath $null
    }
    $slb | Set-AzLoadBalancer
}



