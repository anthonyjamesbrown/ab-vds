$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$($TestScriptPath.Path)\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {

    It "Test $FunctionName`: Active VDS leader node should be returned." {
        
        $JsonObject = '{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"WPRSEDIFVDS002V.asurion.org":{"isVdsLeader":"false"}},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"WPRSEDIFVDS003V.asurion.org":{"isVdsLeader": "true"}},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"WPRSEDIFVDS001V.asurion.org":{"isVdsLeader":"false"}}}'

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }

        $Result = Get-VDSActiveLeaderNode -Server 'sed.vds.prod.asurion.net'
        $Result | Should -match '^wprsedifvds00[0-9]v\.asurion\.org$'        
    }
}
