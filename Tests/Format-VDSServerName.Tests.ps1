$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName with server value: 'vds.prod.asurion.com' should return: 'vds.prod.asurion.net'" {
        $Result = Format-VDSServerName -Server 'vds.prod.asurion.net'
        $Result | Should -Be 'vds.prod.asurion.net'
    }

    It "Test $FunctionName with server value: 'ned.vds.prod.asurion.com' should return: 'ned.vds.prod.asurion.net'" {
        $Result = Format-VDSServerName -Server 'ned.vds.prod.asurion.net'
        $Result | Should -Be 'ned.vds.prod.asurion.net'
    }

    It "Test $FunctionName  with server value: 'sed' should return: 'sed.vds.prod.asurion.net'" {
        $Result = Format-VDSServerName -Server 'sed'
        $Result | Should -Be 'sed.vds.prod.asurion.net'
    }    

    It "Test $FunctionName  with server value: 'wprnedifvds001v' should return: 'wprnedifvds001v.asurion.org'" {
        $Result = Format-VDSServerName -Server 'wprnedifvds001v'
        $Result | Should -Be 'wprnedifvds001v.asurion.org'
    }

    It "Test $FunctionName  with server value: 'wprnedifvds002v.asurion.org' should return: 'wprnedifvds002v.asurion.org'" {
        $Result = Format-VDSServerName -Server 'wprnedifvds002v.asurion.org'
        $Result | Should -Be 'wprnedifvds002v.asurion.org'
    }

    It "Test $FunctionName  with server value: 'banana' should return: null or empty" {
        $Result = Format-VDSServerName -Server 'banana'
        $Result | Should -BeNullOrEmpty
    }

    It "Test $FunctionName  with server value: 'wprnedifvds.net' should return: null or empty" {
        $Result = Format-VDSServerName -Server 'wprnedifvds.net'
        $Result | Should -BeNullOrEmpty
    }
}