$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$template = Split-Path -Leaf $here

$ParameterFileTestCases = @{}

foreach($file in (Get-ChildItem "$here\..\tier1.storageaccount.parameters.json" | Select-Object -ExpandProperty Name) ) {
    $ParameterFileTestCases += @{ParameterFile = $file }
}
Describe "Storage Account Deployment Tests" {
  BeforeAll {
    $DebugPreference = "Continue"
  }

  AfterAll {
    $DebugPreference = "SilentlyContinue"
  }

  $arm = Get-Content -Raw -Path 'C:\Users\bwatts\source\repos\POC-RDS\POC-RDS\Tier 1\Storage Accounts\Tier1.StorrageAccount\Tier1.StorageAccounts.Parameters.json' | ConvertFrom-Json

   
  Context "Test parameters for Storage Account creation" {
    Write-Host $arm.parameters.NumberofAccounts.value
    It "Should be less than 10 storage accounts" {
      [int]$arm.parameters.NumberofAccounts.value | Should -Be 2
    }

 }

}