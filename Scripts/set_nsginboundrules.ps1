param(
    [string]$nsgName="hubworkload_nsg",
    [string]$ruleName="rdp-rule",
    [string]$ruleDescription="Allow RDP from Internet",
    [string]$access="Allow",
    [string]$protocol="Tcp",
    [string]$direction="Inbound",
    [int]$priority=100,
    [string]$sourceAddressPrefix="Internet",
    [string]$sourcePortRange="*",
    [string]$destinationAddressPrefix="*",
    [string]$destinationPortRange="3389",
    [string]$rgname="IaC_HubSpoke"
)

$nsg = Get-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rgname

$nsg | Add-AzNetworkSecurityRuleConfig -Name $ruleName -Description $ruleDescription `
    -Access $access -Protocol $protocol -Direction $direction -Priority $priority -SourceAddressPrefix $sourceAddressPrefix `
    -SourcePortRange $sourcePortRange -DestinationAddressPrefix $destinationPortRange -DestinationPortRange $destinationPortRange


$nsg | Set-AzNetworkSecurityGroup