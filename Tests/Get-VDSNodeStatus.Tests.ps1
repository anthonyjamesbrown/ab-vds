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
    It "Test $FunctionName`: All nodes should have LDAP SSL enabled." {

        $JsonObject = '{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"ldap_status":"ON","vrs_status":"OFF","ldap_ssl_status":"ON","zk_status":"ON","mq_status":"ON","http_status":"ON","vrs_ssl_status":"OFF","glassFish_status":"OFF","https_status":"ON"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"ldap_status":"ON","vrs_status":"OFF","ldap_ssl_status":"ON","zk_status":"ON","mq_status":"ON","http_status":"ON","vrs_ssl_status":"OFF","glassFish_status":"ON","https_status":"ON"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"ldap_status":"ON","vrs_status":"OFF","ldap_ssl_status":"ON","zk_status":"ON","mq_status":"ON","http_status":"ON","vrs_ssl_status":"OFF","glassFish_status":"OFF","https_status":"ON"}}'

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }
        
        $Result = Get-VDSNodeStatus -Server 'vds.prod.asurion.net'
        $Result | Select-Object -ExpandProperty ldap_ssl_status -Unique | Should -Be 'ON'
    }
}





