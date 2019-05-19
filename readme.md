# IaC Repository
This Infrastructure as code repository contains the building blocks that are required to utilize Azure DevOps to build the necessary build and release pipelines.

For detailed documentation on what components make up Azure DevOps click [here](https://docs.microsoft.com/en-us/azure/devops/?view=azure-devops)

This Repository is made up of Azure ARM Templates and Azure PowerShell scripts.

## Templates in this Repository

- Tier 1 ARM Templates
	> [Network Interface]("./Tier 1/Nics/Tier1.Nics/Tier1.Nics/README.md")  
	> [Availability Set]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FAvailabiity%20Set%2FTier1.AvailabilitySet%2FREADME.md&version=GBmaster")  
	> [Network Security Group]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FNSG%2FTier1.NSG%2FTier1.NSG%2FREADME.md&version=GBmaster")  
	> [Public IP]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FPublic%20IP%2FPublicIP%2FPublicIP%2FREADME.md&version=GBmaster")  
	> [Storage Account]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FStorage%20Accounts%2FTier1.StorrageAccount%2FREADME.md&version=GBmaster")  
	> [Hub VNet]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.HubVNET%2FREADME.md&version=GBmaster")  
	> [VNet]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.VNET%2FREADME.md&version=GBmaster")  
	> [VNet Peering]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.VNETPeering%2FREADME.md&version=GBmaster")

- Tier 2 ARM Templates
	> [VMs in Availability Set]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%202%2FVirtual%20Machines%2FTier2.VMinAvailabilitySet%2FREADME.md&version=GBmaster")  
	> [Standalone VMs]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%202%2FVirtual%20Machines%2FTier2.VMsStandalone%2FTier2.VMsStandalone%2FREADME.md&version=GBmaster")  
	> [Public Load Balancer]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%202%2FLoad%20Balancers%2FPublic%20Load%20Balancer%2FPublic%20Load%20Balancer%2FREADME.md&version=GBmaster")  

## Scripts in this Repository  
- Network Scripts
	> [NSG Add Inbound Security Rule]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_nsginboundrule.md&version=GBmaster")  
 	> [Load Balancer add Availability Set to Backend Pool]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbAvailabilitySetBackEndPool.md&version=GBmaster")  
 	> [Load Balancer add Public IP Frontend Config]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbaddpublicipFrontendConfig.md&version=GBmaster")  
 	> [Load Balancer add Health Probe]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbHealthProbe.md&version=GBmaster")  
 	> [Load Balancer add Load Balancing Rule]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbLoadBalancingRule.md&version=GBmaster")  
 	> [Load Balancer add NAT Rule]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbNatRule.md&version=GBmaster")  
