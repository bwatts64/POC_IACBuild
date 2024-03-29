﻿param(
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
    [string]$destinationPortRange,
    [string]$rgName
)

$nsg = Get-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rgName


    $nsg | Add-AzNetworkSecurityRuleConfig -Name $ruleName -Description $ruleDescription `
        -Access $access -Protocol $protocol -Direction $direction -Priority $priority -SourceAddressPrefix $sourceAddressPrefix `
        -SourcePortRange $sourcePortRange -DestinationAddressPrefix $destinationAddressPrefix -DestinationPortRange $destinationPortRange


    $nsg | Set-AzNetworkSecurityGroup
