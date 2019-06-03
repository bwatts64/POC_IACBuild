<#
.SYNOPSIS
    Updates the Azure Load Balancer backend Pool
.DESCRIPTION
    Add's vm's to the backend pool of the specified Azure Load Balancer.
.OUTPUTS
    Progress messages
#>
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True)]
    [string]$loadBalancerName,
    [string]$availabilitySetName,
    [Parameter(Mandatory = $True)]
    [string]$backendPoolName,
    [Parameter(Mandatory = $True)]
    [string]$resourceGroupName
)

$ErrorActionPreference = "Stop"

Try {
    $loadBalancer = Get-AzLoadBalancer `
        -Name $loadBalancerName `
        -ResourceGroupName $resourceGroupName `
        -ErrorAction Stop
}
Catch {
    Write-Error "No Load Balancer found with name $loadBalancerName in resource group $resourceGroupName"
    Return
}

try {
    $backendPool = Get-AzLoadBalancerBackendAddressPoolConfig `
        -Name $backendPoolName `
        -LoadBalancer $loadBalancer
}
catch {
    Write-Error "no Backend Pool found with the name $backendPoolName in the load balancer with the name $loadBalancerName"
    Return
}

try {
    $AvSet = Get-AzAvailabilitySet `
        -Name $availabilitySetName `
        -ResourceGroupName $resourceGroupName
}
catch {
    Write-Error "no AvailabilitySet found with the name $availabilitySetName in resource group $availabilitySetResourceGroup"
    Return
}

ForEach ($id in $avSet.VirtualMachinesReferences.id) {

    $nic = Get-AzNetworkInterface -ResourceGroupName $resourceGroupName | Where-Object {($_.VirtualMachine -ne $null) -and ($_.VirtualMachine.id).ToLower() -eq ($id).ToLower()}
    
    $i=0

    while(($i -lt 5) -and $nic.IpConfigurations[0].LoadBalancerBackendAddressPools -ne $backendPool) {
        $nic.IpConfigurations[0].LoadBalancerBackendAddressPools = $backendPool
        start-sleep -Seconds 10
        $i++
    }

    Set-AzNetworkInterface -NetworkInterface $nic
    Start-Sleep -Seconds 45   
}    

If ($ErrorMessages) {
    Write-Error "Deployment returned the following errors: $ErrorMessages";
    Return
}