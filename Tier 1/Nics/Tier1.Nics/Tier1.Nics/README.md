# Tier 1 NICS
This template deploys a Network Interface to a Resource Group in Azure. This template is usually deployed before and used in the below templates:

<a href="https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%202%2FVirtual%20Machines%2FTier2.VMinAvailabilitySet%2FREADME.md&version=GBmaster">VM in Availabilit Set</a>

The deployment of this template is dependant of the following Network templates being deployed first

<a href="https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.HubVNET%2FREADME.md&version=GBmaster">Hub Virtual Network</a>  
<a href="https://dev.azure.com/Security-Monitoring/_git/IaC_HubSpokeNetwork?path=%2FTier%201%2FVNets%2FTier1.VNET%2FREADME.md&version=GBmaster">Virtual Network</a>  

## Required Inputs
In order to execute this template you must provide the following information.  

- nicName: Display Name for the network interface
- subnetId: Resource ID for the subnet the NIC will be placed on

## Outputs
This template will output the following information to be used by other templates. 

- nicResourceID: ResourceID for the network interface that is created.

## Example Usage in Azure DevOps

1) Utilize the Azure Resource Group Deployment Task  

2) Choose the Azure subscription to deploy the task to

3) The "Action" should be "Create or update resource group"

4) Fill in the information for the "Resource group" and "Location"

5) Point to the template file located 

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.Nics/azuredeploy.json

6) Point to the parameter file located

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.Nics/azuredeploy.parameters.json

7) Override the nicName and subnetID property. Typicall you'll use the output variable from when you created the VNET to provide the subnet ID



