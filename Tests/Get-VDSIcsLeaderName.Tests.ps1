$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: Return active ICS Leader node (wprsedifvds003v.asurion.org)." {
        
        mock 'Get-VDSClusterInfo' -MockWith { '{"upTime":"3417922516","data":"9390179","vdsLeader":"aaeccabc-7af2-4fcf-b2db-020690112f5c","vdsIcsLeaderSame":"true","name":"vds_sed","storeCount":"19","nodeCount":"3","readOnly":"false","icsLeader":"aaeccabc-7af2-4fcf-b2db-020690112f5c","mqType":"GF","mqUrl":"[\"WPRSEDIFVDS001V.asurion.org:7676\"]","vdsLeaderName":"wprsedifvds003v.asurion.org","icsLeaderName":"wprsedifvds003v.asurion.org"}' | ConvertFrom-Json }

        $Result = Get-VDSIcsLeaderName -Server 'vds.prod.asurion.net'
        $Result | Should -Be 'wprsedifvds003v.asurion.org'
    }
}

