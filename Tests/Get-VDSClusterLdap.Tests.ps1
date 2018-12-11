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
    It "Test $FunctionName`: LDAPS value for connection between wprsedifvds003v and 002v should return true." {

        $JsonObject = '{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"ldap":"true","ldaps":"true","errors":"[]"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"ldap":"true","ldaps":"true","errors":"[]"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"ldap":"NA","ldaps":"NA","errors":"[]"}},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"ldap":"true","ldaps":"true","errors":"[]"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"ldap":"true","ldaps":"true","errors":"[]"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"ldap":"NA","ldaps":"NA","errors":"[]"}},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"ldap":"NA","ldaps":"NA","errors":"[]"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"ldap":"NA","ldaps":"NA","errors":"[]"}}}'

		mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json}
        
        $Result = Get-VDSClusterLdap -Server 'vds.prod.asurion.net'
        $LdapsStatus = $Result | Where-Object { $_.Source -eq 'wprsedifvds003v.asurion.org' -and $_.Target -eq 'wprsedifvds002v.asurion.org'} | Select-Object -ExpandProperty ldaps
        $LdapsStatus | Should -Be 'true'
    }
}