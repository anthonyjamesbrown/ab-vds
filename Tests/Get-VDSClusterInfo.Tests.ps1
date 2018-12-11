$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

function Get-VDSNodeName($CloudId)
{
    switch($CloudId)
    {
        'a80969d3-0f8c-4e0f-9a09-0579e92023f1' {'wprsedifvds001v.asurion.org'}
        '914d3436-0f5f-4239-a76d-bcaaab111c95' {'wprsedifvds002v.asurion.org'}
        'aaeccabc-7af2-4fcf-b2db-020690112f5c' {'wprsedifvds003v.asurion.org'}
    }
}

Describe "Unit Test: $FunctionName" {

    It "Test $FunctionName with for all attribute return values." {

        $JsonObject = '{"upTime":"3325456969","data":"9975977","vdsLeader":"aaeccabc-7af2-4fcf-b2db-020690112f5c","vdsIcsLeaderSame":"true","name":"vds_sed","storeCount":"19","nodeCount":"3","readOnly":"false","icsLeader":"aaeccabc-7af2-4fcf-b2db-020690112f5c","mqType":"GF","mqUrl":"[\"WPRSEDIFVDS001V.asurion.org:7676\"]"}'
        
        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }

        $Result = Get-VDSClusterInfo -Server 'vds.prod.asurion.net'

        $Result.upTime | Should -Be '3341408939'
        $Result.data | Should -Be '10280124'
        $Result.vdsLeader | Should -Be 'aaeccabc-7af2-4fcf-b2db-020690112f5c'
        $Result.vdsIcsLeaderSame | Should -Be 'true'
        $Result.name | Should -Be 'vds_sed'
        $Result.storeCount | Should -Be '19'
        $Result.nodeCount | Should -Be '3'
        $Result.readOnly | Should -Be 'false'
        $Result.icsLeader | Should -Be 'aaeccabc-7af2-4fcf-b2db-020690112f5c'
        $Result.mqType | Should -Be 'GF'
        $Result.mqUrl | Should -Be '["WPRSEDIFVDS001V.asurion.org:7676"]'
        $Result.vdsLeaderName | Should -Be 'wprsedifvds003v.asurion.org'
        $Result.icsLeaderName | Should -Be 'wprsedifvds003v.asurion.org'

    }
}
