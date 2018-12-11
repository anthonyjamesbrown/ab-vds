$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: Retuns cluster read only status, should be false." {
        
        $JsonObject = '{"upTime":"3419392925","data":"9433833","vdsLeader":"aaeccabc-7af2-4fcf-b2db-020690112f5c","vdsIcsLeaderSame":"true","name":"vds_sed","storeCount":"19","nodeCount":"3","readOnly":"false","icsLeader":"aaeccabc-7af2-4fcf-b2db-020690112f5c","mqType":"GF","mqUrl":"[\"WPRSEDIFVDS001V.asurion.org:7676\"]"}'

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }

        $Result = Get-VDSIsClusterReadOnly -Server 'vds.prod.asurion.net'
        $Result | Should -Be 'false'
    }
}

