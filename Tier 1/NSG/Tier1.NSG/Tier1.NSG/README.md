# Tier 1 Network Security Group
This template deploys a Network Security Group to a Resource Group in Azure.  

This template is usually deployed before and used in the below template:

> [Hub VNet]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.HubVNET&version=GBmaster")  
> [VNet]("https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.VNET%2FREADME.md&version=GBmaster")

This template is usually deployed before and used in the below script:

[Inbound Security Rule Script](https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FScripts%2Freadme_nsginboundrule.md&version=GBmaster)

The deployment of this template is not dependent on any other templates.

## Required Inputs
In order to execute this template you must provide the following information.  

- nsgName: Display Name for the Network Security Group when created.  

## Outputs
This template will output the following information to be used by other templates.  
- nsgID: This is the Network Security Group ResourceID
- nsgName: This is the display name of the Network Security Group

## Example Usage in Azure DevOps

1) Utilize the Azure Resource Group Deployment Task  

2) Choose the Azure subscription to deploy the task to

3) The "Action" should be "Create or update resource group"

4) Fill in the information for the "Resource group" and "Location"

5) Point to the template file located 

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.NSG/azuredeploy.json

6) Point to the parameter file located

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.NSG/azuredeploy.parameters.json

7) Override the nsgName property with the name you want for the availability set

![](./pics/nsgdeploy.jpg)


