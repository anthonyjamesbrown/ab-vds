$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

$WarningPreference = "SilentlyContinue"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: Should return null." {

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $null }

        $Result = Get-VDSEventLog -Server 'vds.prod.asurion.net'
        $Result | Should -BeNullOrEmpty
    }
}