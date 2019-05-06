$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$template = Split-Path -Leaf $here

Describe "Template: $template - Tier1 Storage Account" -Tags Unit {
  Context "Template File Syntax" {
	  It "Converts from JSON and has the expected Azure Resources" {
	  	  $expectedResources = 'Microsoft.Storage/storageAccounts'
		  $templateResources = (get-content "$here\..\tier1.storageaccounts.deploy.json") | ConvertFrom-JSON -ErrorAction SilentlyContinue
		  $templateResources.resources.type  | Should -Be $expectedResources
	  }
  }

  Context "Test parameters for Storage Account creation" {
    $templateParameters = (get-content "$here\..\tier1.storageaccounts.Parameters.json") | ConvertFrom-JSON -ErrorAction SilentlyContinue
		 

	It "Should be LRS Storage Type" {
		$templateParameters.parameters.StorageAccountType.value | Should -Be "Standard_LRS"
	}

 }

}