function Get-VDSIcsJms
{
    <#
        .SYNOPSIS
            Get information and statistics about all topics in the messaging server for all topologies.
        .DESCRIPTION
            This script returns information and statistics about all topics in the messaging server for all topologies.

            The data returned includes:
            AvgNumMsgs         : Average number of messages currently in the topic.
            DiskUsed           : Current disk space used by the messages in the topic.
            NumActiveConsumers : Number of consumers that subscribe to the topic.
            NumMsgs            : Number of messages currently in the topic.
            PeakMsgBytes       : Peak message size in bytes. 
            TotalMsgBytes      : Total size of messages in bytes that are currently in the topic.

        .EXAMPLE
            PS> Get-VDSIcsJms
            
            Topology           : CF_DC_NEWCORP_DC_COM
            CaptureConnector   : CF_DC_NEWCORP_DC_COM_so_dc_newcorp_dc_com_generic
            NumMsgs            : 0
            AvgNumMsgs         : 0
            PeakMsgBytes       : 1129005
            NumActiveConsumers : 1
            TotalMsgBytes      : 0
            DiskUsed           : 0

            Topology           : CF_DC_NEWCORP_DC_COM
            CaptureConnector   : CF_DC_NEWCORP_DC_COM_so_vdsconnector_cacherefresh_Hub
            NumMsgs            : 0
            AvgNumMsgs         : 0
            PeakMsgBytes       : 1129796
            NumActiveConsumers : 1
            TotalMsgBytes      : 0
            DiskUsed           : 0
            ...

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is the current leader node in the vds.prod.asurion.net active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = (Get-VDSIcsLeaderName)
    ) # end param

    $CollectorKey = 'ics-jms'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $LevelOneProps = $Response.PSObject.Properties.name
    
    $LevelOneProps | ForEach-Object {
        $RootNode = $_
        $SubNode = $Response."$RootNode".PSObject.Properties.Name
        $SubNode | ForEach-Object {
            $Node = $_

            $Object = $Response."$RootNode"."$Node"

            $Object | Add-Member -NotePropertyName 'Topology' -NotePropertyValue $RootNode
            $Object | Add-Member -NotePropertyName 'CaptureConnector' -NotePropertyValue $Node
            $Object | Select-Object Topology,CaptureConnector,NumMsgs,AvgNumMsgs,PeakMsgBytes,NumActiveConsumers,TotalMsgBytes,DiskUsed

        } # end foreach
    } # end foreach
} # end function Get-VDSIcsJms
