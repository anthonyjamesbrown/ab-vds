$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {

    It "Test $FunctionName`: Should return 'vds_sed' as the Central Journal value." {

        $JsonObject = '{"Central Journal (vds_sed)":{"vds_ned":{"ou=jcadev,ou=apps,o=data":{"vdsSyncCursor":"13","ensurePush":"false","missingChanges":"0","errorCode":"","lastChangeNum":"25","publishedChanges":"0","serverId":"5184","subscribedChanges":"0","errors":"[]"},"ou=jcaprod,ou=apps,o=data":{"vdsSyncCursor":"14","ensurePush":"false","missingChanges":"0","errorCode":"","lastChangeNum":"25","publishedChanges":"1","serverId":"10565","subscribedChanges":"0","errors":"[]"}},"vds_sed":{"ou=jcadev,ou=apps,o=data":{"ensurePush":"false","missingChanges":"0","lastChangeNum":"25","publishedChanges":"0","serverId":"379","subscribedChanges":"0"},"ou=jcaprod,ou=apps,o=data":{"ensurePush":"false","missingChanges":"0","lastChangeNum":"25","publishedChanges":"0","serverId":"15370","subscribedChanges":"1"}}}}'
        
        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }

        $Result = Get-VDSCloudReplication
        $Result.CentralJournal -notcontains 'vds_sed' | Should -BeFalse
    }
}



