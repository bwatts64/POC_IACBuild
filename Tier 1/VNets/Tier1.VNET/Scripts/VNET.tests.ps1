$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$template = Split-Path -Leaf $here

Describe "Template: $template - Tier1 Virtual Networks" -Tags Unit {
  Context "Template File Syntax" {
	  It "Converts from JSON and has the expected Azure Resources" {
	  	  $expectedResources = 'Microsoft.Network/virtualNetworks'
		  $templateResources = (get-content "$here\..\tier1.VNET.deploy.json") | ConvertFrom-JSON -ErrorAction SilentlyContinue
		  $templateResources.resources.type  | Should -Be $expectedResources
	  }
  }

  Context "Test parameters for VNET creation" {
    $templateParameters = (get-content "$here\..\tier1.VNET.Parameters.json") | ConvertFrom-JSON -ErrorAction SilentlyContinue
		  
    It "Should be 16 VNET" {
      $templateParameters.parameters.virtualNetworkAddressRange.value | Should -BeLike "*/16"
    }

 }

}