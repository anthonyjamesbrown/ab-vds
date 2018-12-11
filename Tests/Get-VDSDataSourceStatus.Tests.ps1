$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: Should return true for status on all Ldap type records. " {

        $JsonObject = '{"remotefiles":{"datasourceTypeInt":"7","datasourceUrl":"N/A","status":"false"},"concur":{"datasourceTypeInt":"7","datasourceUrl":"https://www.concursolutions.com/api/user/v1.0/User","status":"false"},"components":{"datasourceTypeInt":"7","datasourceUrl":"N/A","status":"false"},"gdatacontacts":{"datasourceTypeInt":"7","datasourceUrl":"N/A","status":"false"},"hqdomain":{"datasourceTypeInt":"1","datasourceUrl":"ldaps://sedadint701.int.asurion.com:636/dc=int,dc=asurion,dc=com","status":"true"},"googledirectory":{"datasourceTypeInt":"7","datasourceUrl":"N/A","status":"false"},"vds":{"datasourceTypeInt":"1","datasourceUrl":"ldap://WPRSEDIFVDS002V.asurion.org:2389/o=vds","status":"true"},"asurion":{"datasourceTypeInt":"1","datasourceUrl":"ldaps://WPRSEDIFADS001V.asurion.org:636/dc=asurion,dc=org","status":"true"},"new_sterling":{"datasourceTypeInt":"1","datasourceUrl":"ldaps://WPRSRDIFADS005V.newcorp.com:636/dc=newcorp,dc=com","status":"true"},"replicationjournal":{"datasourceTypeInt":"1","datasourceUrl":"ldap://WPRSEDIFVDS003V.asurion.org:2389/","status":"true"},"sharepoint":{"datasourceTypeInt":"7","datasourceUrl":"https://10.11.5.112/_vti_bin/userprofileservice.asmx","status":"false"},"workdayhr":{"datasourceTypeInt":"7","datasourceUrl":"workdayurl","status":"false"},"graphapi":{"datasourceTypeInt":"7","datasourceUrl":"https://graph.windows.net/seradiant.onmicrosoft.com","status":"false"},"salesforce":{"datasourceTypeInt":"7","datasourceUrl":"N/A","status":"false"},"vdsha":{"datasourceTypeInt":"1","datasourceUrl":"ldap://WPRSEDIFVDS003V.asurion.org:2389/","status":"true"},"scimclient2":{"datasourceTypeInt":"7","datasourceUrl":"http://localhost:8089/scim2/o=companydirectory/v2","status":"false"},"graphapib2c":{"datasourceTypeInt":"7","datasourceUrl":"https://graph.windows.net/seradiant.onmicrosoft.com","status":"false"},"scimclient":{"datasourceTypeInt":"7","datasourceUrl":"http://localhost:8089/scim/o=companydirectory/v1","status":"false"},"hdfs":{"datasourceTypeInt":"7","datasourceUrl":"N/A","status":"false"},"log2db":{"datasourceTypeInt":"3","datasourceUrl":"jdbc:derby://WPRSEDIFVDS001V.asurion.org:1527/log2db","status":"false"},"sharepointonline":{"datasourceTypeInt":"7","datasourceUrl":"https://myrltestdomain-admin.sharepoint.com","status":"false"},"acsclient":{"datasourceTypeInt":"7","datasourceUrl":"10.11.1.50","status":"false"},"oktaclient":{"datasourceTypeInt":"7","datasourceUrl":"https://your_org.okta.com","status":"false"}}'

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json}
        
        $Result = Get-VDSDataSourceStatus -Server 'vds.prod.asurion.net'
        $LDAPStatus = $Result | Where-Object Type -eq 'LDAP'
        ($LDAPStatus | Select-Object -ExpandProperty Status -Unique | Measure-Object).Count | Should -Be 1
        $LDAPStatus| Select-Object -ExpandProperty Status -Unique | Should -Be 'true'
    }
}