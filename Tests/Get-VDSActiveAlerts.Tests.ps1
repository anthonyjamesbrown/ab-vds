$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {

    It "Test $FunctionName`: Should not return any active-alerts." {
        
        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $null }

        $Result = Get-VDSActiveAlerts
        $Result -eq $null -or [string]::IsNullOrEmpty($Result.ToString()) | Should -BeTrue 
    }

    It "Test $FunctionName: When active alerts are present data should be returned." {
        
        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { 'something' }

        $Result = Get-VDSActiveAlerts
        $Result -ne $null | Should -BeTrue 
    }
}