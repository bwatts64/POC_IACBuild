# Tier 1 Storage Account
This template deploys a Storage Account to a Resource Group in Azure.  

This template is usually deployed before and used by any template that needs to store data in a storage account.

The deployment of this template is not dependent on any other templates.

## Required Inputs
In order to execute this template you must provide the following information.  

- StorageAccountName: This is the name for the storage account. Any input will be converted to all lower case.  
- StorageAccountType: Allowed values are Standard_LRS, Standard_ZRS, Standard_GRS,  Standard_RAGRS, and Premium_LRS

## Outputs
This template will output the following information to be used by other templates.  
- storageAccountKey: This returns the primary key for the storage account  
- storageAccountName: This returns the name of the storage account

## Example Usage in Azure DevOps

1) Utilize the Azure Resource Group Deployment Task  

2) Choose the Azure subscription to deploy the task to

3) The "Action" should be "Create or update resource group"

4) Fill in the information for the "Resource group" and "Location"

5) Point to the template file located 

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.StorrageAccount/Tier1.StorageAccounts.Deploy.json

6) Point to the parameter file located

	$(System.DefaultWorkingDirectory)/_Hub and Spoke/drop/Tier1.StorrageAccount/Tier1.StorageAccounts.Parameters.json

7) Override the Public IP Address properties with the appropriate values

![](./pics/sadeploy.jpg)
