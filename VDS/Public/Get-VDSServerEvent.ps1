function Get-VDSServerEvent
{
    <#
        .SYNOPSIS
            Get the last 15 entries in the server event log file. 
        .DESCRIPTION
            This script returns the last 15 entries in the server event log file (<RLI_HOME>/vds_server/logs/vds_events.log).
        .EXAMPLE
            PS> Get-VDSServerEvent
            
            1       : Frontend started.
            2       : Server started.
            Name    : wprsedifvds002v.asurion.org
            CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Date    : 2018-11-08 22:25:31.465
            Type    : INFO

            3       : Node 914d3436-0f5f-4239-a76d-bcaaab111c95 is up, register tlog replication.
            Name    : wprsedifvds002v.asurion.org
            CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Date    : 2018-11-08 22:25:33.996
            Type    : INFO

            4       : IndexHTTPFollower - [dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\] Closing index with 215996 entries
            Name    : wprsedifvds002v.asurion.org
            CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Date    : 2018-11-08 22:31:37.383
            Type    : INFO

            6       : IndexFollower - [dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\] doUpdateOffline(): session=id=2 version=1 files={index=[fileName=_0.cfe size=405 crc=2306564232,
                    fileName=_0.si size=373 crc=1543502431, fileName=_0.cfs size=1394074533 crc=1662767082, fileName=segments_1 size=136 crc=3673080043]}
            7       : IndexFollower - [dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\] doUpdateOffline(): requiredFiles=[fileName=_0.cfe size=405 crc=2306564232, fileName=_0.si size=373
                    crc=1543502431, fileName=_0.cfs size=1394074533 crc=1662767082, fileName=segments_1 size=136 crc=3673080043]
            8       : IndexFollower - [dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\] doUpdateOffline(): replicating file=_0.cfe
            Name    : wprsedifvds002v.asurion.org
            CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Date    : 2018-11-08 22:34:49.106
            Type    : INFO
            ...

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'server-event'

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
            $ThirdLevelNode = $Response."$RootNode"."$Node".PSObject.Properties.Name
            $ThirdLevelNode | ForEach-Object {
                $Object = $Response."$RootNode"."$Node"."$ThirdLevelNode"
                $Object | Add-Member -NotePropertyName 'Name' -NotePropertyValue (Get-VDSNodeName -CloudId $RootNode)
                $Object | Add-Member -NotePropertyName 'CloudId' -NotePropertyValue $RootNode
                $Object | Add-Member -NotePropertyName 'Date' -NotePropertyValue $Node
                $Object | Add-Member -NotePropertyName "Type" -NotePropertyValue $ThirdLevelNode

                $Object 
            }
        } # end foreach
    } # end foreach
} # end function Get-VDSServerEvent
