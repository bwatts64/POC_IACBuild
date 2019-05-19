Param(
    [Parameter(Mandatory = $True)]
    [string]$LBName,
    [Parameter(Mandatory = $True)]
    [string]$RGName,
    [Parameter(Mandatory = $True)]
    [string]$ProbeName,
    [Parameter(Mandatory = $True)]
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

$healthProbe = New-AzLoadBalancerProbeConfig -Name $ProbeName -RequestPath $RequestPath -Protocol $protocol -Port $Port -IntervalInSeconds $IntervalSeconds -ProbeCount $ProbeCount

$slb | Set-AzLoadBalancerProbeConfig $healthProbe





