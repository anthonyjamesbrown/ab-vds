$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: Should not return null or empty." {
        
        $JsonObject = '{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"ProcessSSLQ_INTL":{"internal":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"640","opThreadPoolSizePeak":"2"}},"ProcessQ_INTL":{"internal":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"640","opThreadPoolSizePeak":"4"}},"ProcessQ_2":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"1"}},"ProcessSSLQ_2":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"4"}},"ProcessQ_1":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"1"}},"ProcessSSLQ_1":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"4"}}},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"ProcessSSLQ_INTL":{"internal":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"640","opThreadPoolSizePeak":"2"}},"ProcessQ_INTL":{"internal":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"640","opThreadPoolSizePeak":"15"}},"ProcessQ_2":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"2"}},"ProcessSSLQ_2":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"9"}},"ProcessQ_1":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"1"}},"ProcessSSLQ_1":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"12"}}},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"ProcessSSLQ_INTL":{"internal":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"640","opThreadPoolSizePeak":"2"}},"ProcessQ_INTL":{"internal":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"640","opThreadPoolSizePeak":"14"}},"ProcessQ_2":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"4"}},"ProcessSSLQ_2":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"4"}},"ProcessQ_1":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"5"}},"ProcessSSLQ_1":{"processing":{"opThreadExecuting":"0","opWaitingInQueue":"0","opThreadPoolSizeMax":"80","opThreadPoolSizePeak":"13"}}}}'
        
        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json}
        
        $Result = Get-VDSProcessInfo -Server 'vds.prod.asurion.net'
        $Result | Should -Not -BeNullOrEmpty
    }
}