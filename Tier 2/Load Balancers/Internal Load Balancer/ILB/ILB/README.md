# Tier 2 Public Load Balancer

This template deploys a Load Balancer with a Public IP front end. It creates an empty backend pool and is intended to be used with the following scripts:

<a href="https://security-monitoring.visualstudio.com/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbAvailabilitySetBackEndPool.md&version=GBmaster">Script: Load Balancer Availability Set Backend Pool</a>  
<a href="https://security-monitoring.visualstudio.com/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbHealthProbe.md&version=GBmaster">Script: Load Balancer Health Probe</a> 
<a href="https://security-monitoring.visualstudio.com/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbLoadBalancingRule.md&version=GBmaster">Script: Load Balancer Load Balancing Rule</a> 
<a href="https://security-monitoring.visualstudio.com/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_lbNatRule.md&version=GBmaster">Script: Load Balancer NAT Rule</a> 

This template is typically deployed after and used the output from the following templates:  
<a href="https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.HubVNET%2FREADME.md&version=GBmaster">Hub VNET</a>  
<a href="https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.VNET%2FREADME.md&version=GBmaster">VNET</a>   
<a href="https://security-monitoring.visualstudio.com/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FAvailabiity%20Set%2FTier1.AvailabilitySet%2FREADME.md&version=GBmaster">Availabiity Set</a>  

## Required Inputs
In order to execute this template you must provide the following information.  

- LBName: Name for the Public Load Balancer that will be created  
- sku: Accepts either Basic or Standard  
- publicIPResourceID:  The Resource ID of the Public IP that will be assigned to the load balancer  
- backendAddressPoolName: Name of the empty backend pool that will be created

## Outputs
The following valued are output from this template:  
-  name: The name of the Public Load Balancer that was created  
-  backendAddressPoolName: The name of the emptly backend pool that was created

## Example Usage in Azure DevOps

1) Utilize the Azure Resource Group Deployment Task  

2) Choose the Azure subscription to deploy the task to

3) The "Action" should be "Create or update resource group"

4) Fill in the information for the "Resource group" and "Location"

5) Point to the template file located 

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier2.VMsStandalone/VMsStandalone.json

6) Point to the parameter file located

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier2.VMsStandalone/VMsStandalone.parameters.json

7) Override the Hub VNet properties with the appropriate values. Below is an example:  
	
	-adminUsername "bwatts" -adminPassword "************" -numberOfInstances 2 -vmNamePrefix "hubjump-" -ipPrefix "10.0.0." -osImagePublisher "MicrosoftWindowsServer" -osImageOffer "WindowsServer" -osImageSKU "2016-Datacenter" -subnetid "$(hubvnet_workloadSubnetId)" -saName "$(hubsa_storageAccountName)" -saKey "$(hubsa_storageAccountKey)" 


![](./pics/vmstandalonedeploy.jpg)
