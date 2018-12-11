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
    It "Test $FunctionName`: Max peakLatency <= 2500 should return true." {

        $JsonObject = '{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"currentLatency":"1","peakLatency":"1578"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"currentLatency":"2","peakLatency":"2078"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"currentLatency":"1","peakLatency":"1546"}},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"currentLatency":"1","peakLatency":"2890"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"currentLatency":"1","peakLatency":"1843"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"currentLatency":"1","peakLatency":"2359"}},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"currentLatency":"0","peakLatency":"1734"},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"currentLatency":"0","peakLatency":"2277"},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"currentLatency":"0","peakLatency":"859"}}}'

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json}

        $Result = Get-VDSClusterLatency -Server 'vds.prod.asurion.net'
        ($Result.peakLatency | Measure-Object).Maximum | Should -BeLessOrEqual 2500
    }
}
