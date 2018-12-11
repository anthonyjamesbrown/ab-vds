$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {

    $JsonObject = '{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"installPath":"E:\\radiantone\\vds","product":"RadiantOne FID","javaVersion":"1.8.0_161-b12","vdsBuild":"v7.2.21.r44703-02012018-0410","ip":"10.5.94.179","isEnableSsl":"YES","portSsl":"636","nodeType":"READ_WRITE","javaHome":"E:\\radiantone\\vds\\jdk\\jre","currentTime":"Mon Nov 26 10:13:37 EST 2018","license":"Full, licensed to matt.chambers@asurion.com","port":"2389","cloudId":"914d3436-0f5f-4239-a76d-bcaaab111c95","name":"WPRSEDIFVDS002V.asurion.org","createdTime":"Thu Aug 10 14:14:42 EDT 2017","vdsVersion":"7.2.21.r44703","startTime":"Thu Nov 08 22:24:56 EST 2018"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"installPath":"E:\\radiantone\\vds","product":"RadiantOne FID","javaVersion":"1.8.0_161-b12","vdsBuild":"v7.2.21.r44703-02012018-0410","ip":"10.5.94.180","isEnableSsl":"YES","portSsl":"636","nodeType":"READ_WRITE","javaHome":"E:\\radiantone\\vds\\jdk\\jre","currentTime":"Mon Nov 26 10:13:37 EST 2018","license":"Full, licensed to matt.chambers@asurion.com","port":"2389","cloudId":"aaeccabc-7af2-4fcf-b2db-020690112f5c","name":"WPRSEDIFVDS003V.asurion.org","createdTime":"Thu Aug 10 14:14:42 EDT 2017","vdsVersion":"7.2.21.r44703","startTime":"Fri Oct 19 01:06:25 EDT 2018"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"installPath":"E:\\radiantone\\vds","product":"RadiantOne FID","javaVersion":"1.8.0_161-b12","vdsBuild":"v7.2.21.r44703-02012018-0410","ip":"10.5.94.170","isEnableSsl":"YES","portSsl":"636","nodeType":"READ_WRITE","javaHome":"E:\\radiantone\\vds\\jdk\\jre","currentTime":"Mon Nov 26 10:13:37 EST 2018","license":"Full, licensed to matt.chambers@asurion.com","port":"2389","cloudId":"a80969d3-0f8c-4e0f-9a09-0579e92023f1","name":"WPRSEDIFVDS001V.asurion.org","createdTime":"Thu Aug 10 14:14:42 EDT 2017","vdsVersion":"7.2.21.r44703","startTime":"Fri Oct 19 02:40:28 EDT 2018"}}'

    It "Test $FunctionName`: CloudId should be returned for the supplied NodeName." {

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }

        $Result = Get-VDSCloudId -Server 'wprsedifvds003v' -NodeName 'wprsedifvds003v'
        $Result | Should -Be 'aaeccabc-7af2-4fcf-b2db-020690112f5c'
    }

    It "Test $FunctionName`: A null value should be returned for a invalid NodeName." {

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }

        $Result = Get-VDSCloudId -Server 'wprsedifvds003v' -NodeName 'wprsedifvds003v.wrong'
        $Result | Should -BeNullOrEmpty
    }
}
