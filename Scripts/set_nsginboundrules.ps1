param(
    [string]$nsgName,
    [string]$ruleName,
    [string]$ruleDescription,
    [string]$access,
    [string]$protocol,
    [string]$direction,
    [int]$priority,
    [string]$sourceAddressPrefix,
    [string]$sourcePortRange,
    [string]$destinationAddressPrefix,
    [string]$destinationPortRange
)

$nsg = Get-AzureRMNetworkSecurityGroup -Name LABVM-nsg

$nsg | Add-AzureRMNetworkSecurityRuleConfig -Name $ruleName -Description $ruleDescription `
    -Access $access -Protocol $protocol -Direction $direction -Priority $priority -SourceAddressPrefix $sourceAddressPrefix `
    -SourcePortRange $sourcePortRange -DestinationAddressPrefix $destinationPortRange -DestinationPortRange $destinationPortRange


$nsg | Set-AzureRMNetworkSecurityGroup