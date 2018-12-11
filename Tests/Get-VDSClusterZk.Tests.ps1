$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: Nine records should be returned and the canRead attribute value for all records should be the same (OK)." {

        $JsonObject = '{"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"canRead":"OK","canWrite":"OK","errors":"{ }"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"canRead":"OK","canWrite":"OK","errors":"{ }"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"canRead":"OK","canWrite":"OK","errors":"{ }"}},"914d3436-0f5f-4239-a76d-bcaaab111c95":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"canRead":"OK","canWrite":"OK","errors":"{ }"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"canRead":"OK","canWrite":"OK","errors":"{ }"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"canRead":"OK","canWrite":"OK","errors":"{ }"}},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"canRead":"OK","canWrite":"OK","errors":"{ }"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"canRead":"OK","canWrite":"OK","errors":"{ }"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"canRead":"OK","canWrite":"OK","errors":"{ }"}}}'

		mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json}
        
        $Result = Get-VDSClusterZk -Server 'vds.prod.asurion.net'
        $Result.Count | Should -Be 9
        ($Result.canread | Select-Object -Unique | Measure-Object).Count | Should -Be 1
    }
}