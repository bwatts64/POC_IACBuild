# Tier 1 VNET Peering

This template implements VNET Peering between two VNETs in Azure. The VNETs to be peered must already exist in Azure.

This template is usually deployed after the following templates:    
	<a href="https://security-monitoring.visualstudio.com/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.HubVNET%2FREADME.md&version=GBmaster">Hub Virtual Network Deployment</a>  
	<a href="https://security-monitoring.visualstudio.com/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.VNET%2FREADME.md&version=GBmaster">Virtual Network Deployment</a>  


## Required Inputs
In order to execute this template you must provide the following information.  

- sourceVNetName: The name of the source VNET to be peered
- sourceVNetID: The resource id of the source VNET to be peered
- destVNetID: The resource id of the target VNET to be peered
- peeringName: The name for the peering relationship


## Outputs
This template currently doesn't output any values.

## Example Usage in Azure DevOps

1) Utilize the Azure Resource Group Deployment Task  

2) Choose the Azure subscription to deploy the task to

3) The "Action" should be "Create or update resource group"

4) Fill in the information for the "Resource group" and "Location"

5) Point to the template file located 

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.VNETPeering/azuredeploy.json

6) Point to the parameter file located

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.VNETPeering/azuredeploy.parameters.json

7) Override the properties with the appropriate values. Below is an example:  
	
	-sourceVNetName "$(hubvnet_vnetname)" -sourceVNetID "$(hubvnet_vnetid)" -destVNetID "$(s2vnet_vnetid)" -peeringName "HubVNETtoSpoke2VNET" 


![](./pics/peeringdeploy.jpg)
