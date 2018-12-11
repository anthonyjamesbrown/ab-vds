$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: All nodes disk percent should be less than 70%." {
        
        $JsonObject = '{"914d3436-0f5f-4239-a76d-bcaaab111c95":{"WPRSEDIFVDS002V.asurion.org":{"systemUsedSwapPercent":"30","connectionTotal":"356","isIcsLeader":"false","memoryPercent":"13.7","diskTotal":"107371032576","memoryMax":"5592576","isVdsRunning":"true","memoryUsed":"766205","systemOpenFileDescriptorsPercent":"n/a","connectionMax":"1000","committedVirtualMemorySize":"4119490560","connectionPercent":"5.9","jvmThreadCount":"266","memoryPeak":"992122","memoryAlloc":"1020416","cpuPeak":"79","cpuAvg":"5","systemUsedPhysicalMemoryPercent":"43","diskLatency":"0","operationTotal":"4164017","diskLatencyPeak":"15","cpu":"6","isControlPanelRunning":"true","connectionPeak":"62","disk":"72810409984","systemUsedSwap":"15296020480","isVdsLeader":"false","systemLoadAverage":"-1.0","systemOpenFileDescriptors":"n/a","activeConnections":"59","diskPeak":"75211079680","diskPercent":"67.81","systemUsedPhysicalMemory":"11251892224"}},"aaeccabc-7af2-4fcf-b2db-020690112f5c":{"WPRSEDIFVDS003V.asurion.org":{"systemUsedSwapPercent":"28","connectionTotal":"1198","isIcsLeader":"true","memoryPercent":"18.67","diskTotal":"107371032576","memoryMax":"5592576","isVdsRunning":"true","memoryUsed":"1043870","systemOpenFileDescriptorsPercent":"n/a","connectionMax":"1000","committedVirtualMemorySize":"3017715712","connectionPercent":"15.0","jvmThreadCount":"385","memoryPeak":"2916271","memoryAlloc":"1923072","cpuPeak":"99","cpuAvg":"45","systemUsedPhysicalMemoryPercent":"66","diskLatency":"0","operationTotal":"237286545","diskLatencyPeak":"48","cpu":"51","isControlPanelRunning":"true","connectionPeak":"159","disk":"55931367424","systemUsedSwap":"14296088576","isVdsLeader":"true","systemLoadAverage":"-1.0","systemOpenFileDescriptors":"n/a","activeConnections":"150","diskPeak":"60580167680","diskPercent":"52.09","systemUsedPhysicalMemory":"17188990976"}},"a80969d3-0f8c-4e0f-9a09-0579e92023f1":{"WPRSEDIFVDS001V.asurion.org":{"systemUsedSwapPercent":"49","connectionTotal":"429","isIcsLeader":"false","memoryPercent":"14.62","diskTotal":"107371032576","memoryMax":"5592576","isVdsRunning":"true","memoryUsed":"817875","systemOpenFileDescriptorsPercent":"n/a","connectionMax":"1000","committedVirtualMemorySize":"13433655296","connectionPercent":"3.2","jvmThreadCount":"290","memoryPeak":"1024358","memoryAlloc":"1034752","cpuPeak":"60","cpuAvg":"5","systemUsedPhysicalMemoryPercent":"80","diskLatency":"0","operationTotal":"39020623","diskLatencyPeak":"2","cpu":"5","isControlPanelRunning":"true","connectionPeak":"36","disk":"55418810368","systemUsedSwap":"24640892928","isVdsLeader":"false","systemLoadAverage":"-1.0","systemOpenFileDescriptors":"n/a","activeConnections":"32","diskPeak":"57114705920","diskPercent":"51.61","systemUsedPhysicalMemory":"20717142016"}}}'

        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json}
        
        $Result = Get-VDSNodeMonitor -Server 'vds.prod.asurion.net'
        ($Result.diskPercent | Measure).Maximum | Should -BeLessThan 70
    }
}