$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$template = Split-Path -Leaf $here

Describe "Template: $template - Tier1 LA Workspace" -Tags Unit {
  Context "Template File Syntax" {
	  It "Converts from JSON and has the expected Azure Resources" {
	  	  $expectedResources = 'Microsoft.OperationalInsights/workspaces'
		  $templateResources = (get-content "$here\..\tier1.loganalytics.deploy.json") | ConvertFrom-JSON -ErrorAction SilentlyContinue
		  $templateResources.resources.type  | Should -Be $expectedResources
	  }
  }

  Context "Test parameters for LA Workspace creation" {
    $templateParameters = (get-content "$here\..\tier1.loganalytics.Parameters.json") | ConvertFrom-JSON -ErrorAction SilentlyContinue
		  
    It "Name should exists" {
        $templateParameters.parameters.name.value | Should -Not -BeNullOrEmpty
    }

	It "Should be standard sku" {
		$templateParameters.parameters.sku.value | Should -Be "standalone"
	}

	It "Should be kusto search type" {
		$templateParameters.parameters.searchVersion.value | Should -Be 1
	}

 }

}