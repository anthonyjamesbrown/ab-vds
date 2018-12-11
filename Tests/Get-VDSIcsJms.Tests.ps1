$ScriptName = $MyInvocation.MyCommand.Name
$ScriptPath = $PSScriptRoot
$ScriptUnderTest = if($ScriptName.EndsWith(".Tests.ps1")) { $ScriptName.Replace(".Tests.ps1", ".ps1") }
$TestScriptPath = Resolve-Path $ScriptPath\..\VDS\Public
$FunctionName = $ScriptUnderTest.Replace(".ps1", "")

. "$TestScriptPath\$ScriptUnderTest"

Describe "Unit Test: $FunctionName" {
    It "Test $FunctionName`: Return true is all expected object attributes exist." {

        $JsonObject = '{"CF_DC_NEWCORP_DC_COM":{"CF_DC_NEWCORP_DC_COM_so_dc_newcorp_dc_com_generic":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1129005","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_DC_NEWCORP_DC_COM_so_vdsconnector_cacherefresh_Hub":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1129796","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"}},"CF_DC_ASURION_DC_ORG":{"CF_DC_ASURION_DC_ORG_so_dc_asurion_dc_org_generic":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1528557","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_DC_ASURION_DC_ORG_so_vdsconnector_cacherefresh_Hub":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1530648","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"}},"CF_DC_INT_DC_ASURION_DC_COM":{"CF_DC_INT_DC_ASURION_DC_COM_so_dc_int_dc_asurion_dc_com_generic":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"4410436","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_DC_INT_DC_ASURION_DC_COM_so_vdsconnector_cacherefresh_Hub":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"4368963","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"}},"CF_O_SID":{"CF_O_SID_so_dc_asurion_dc_org_custom_group":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1497498","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_O_SID_so_vdsconnector_cacherefresh_Hub":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1936979","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_O_SID_so_dc_asurion_dc_org_custom_user":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"378493","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_O_SID_so_dc_int_dc_asurion_dc_com_custom_group":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"962121","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_O_SID_so_dc_newcorp_dc_com_custom_group":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"427618","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_O_SID_so_dc_newcorp_dc_com_custom_user":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1178633","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_O_SID_so_dc_int_dc_asurion_dc_com_custom_user":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1931260","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"}},"CF_OU_DN_O_VIEW":{"CF_OU_DN_O_VIEW_so_dc_asurion_dc_org_custom_group":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1507862","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_OU_DN_O_VIEW_so_vdsconnector_cacherefresh_Hub":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"2018759","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_OU_DN_O_VIEW_so_dc_asurion_dc_org_custom_user":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"378501","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_OU_DN_O_VIEW_so_dc_int_dc_asurion_dc_com_custom_group":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"962129","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_OU_DN_O_VIEW_so_dc_newcorp_dc_com_custom_group":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"427626","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_OU_DN_O_VIEW_so_dc_newcorp_dc_com_custom_user":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"1178641","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"},"CF_OU_DN_O_VIEW_so_dc_int_dc_asurion_dc_com_custom_user":{"NumMsgs":"0","AvgNumMsgs":"0","PeakMsgBytes":"2013396","NumActiveConsumers":"1","TotalMsgBytes":"0","DiskUsed":"0"}}}'

        mock 'Get-VDSIcsLeaderName' -MockWith { 'wprsedifvds003v.asurion.org' }
        mock 'Invoke-VDSAdminAPIRestMethod' -MockWith { $JsonObject | ConvertFrom-Json }

        $Result = Get-VDSIcsJms -Server 'vds.prod.asurion.net'        
        $PropList = $Result | Get-Member | Where-Object MemberType -eq 'NoteProperty' | Select-Object -ExpandProperty Name

        $PropList -contains 'Topology' | Should -BeTrue
        $PropList -contains 'CaptureConnector' | Should -BeTrue
        $PropList -contains 'NumMsgs' | Should -BeTrue
        $PropList -contains 'AvgNumMsgs' | Should -BeTrue
        $PropList -contains 'PeakMsgBytes' | Should -BeTrue
        $PropList -contains 'NumActiveConsumers' | Should -BeTrue
        $PropList -contains 'TotalMsgBytes' | Should -BeTrue
        $PropList -contains 'DiskUsed' | Should -BeTrue    
    }
}
