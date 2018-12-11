function Get-VDSClusterLatency
{
    <#
        .SYNOPSIS
            Returns information about cluster latency.
        .DESCRIPTION
            This script returns information about the current network latency and peak network latency both on the local node and between cluster nodes.

            currentLatency : Current network latency (in milliseconds).  This property requires an FID to be running in order to return information.
            peakLatency    : Peak network latency (in milliseconds), since the RadiantOne FID service started.
        .EXAMPLE
            PS> Get-VDSClusterLatency       

            Source         : wprsedifvds002v.asurion.org
            SourceCloudId  : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Target         : wprsedifvds002v.asurion.org
            TargetCloudId  : 914d3436-0f5f-4239-a76d-bcaaab111c95
            currentLatency : 0
            peakLatency    : 1578

            Source         : wprsedifvds002v.asurion.org
            SourceCloudId  : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Target         : wprsedifvds003v.asurion.org
            TargetCloudId  : aaeccabc-7af2-4fcf-b2db-020690112f5c
            currentLatency : 15
            peakLatency    : 2078      
            ....

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'cluster-latency'

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

            $Object | Add-Member -NotePropertyName 'Source' -NotePropertyValue (Get-VDSNodeName -CloudId $RootNode)
            $Object | Add-Member -NotePropertyName 'SourceCloudId' -NotePropertyValue $RootNode
            $Object | Add-Member -NotePropertyName 'Target' -NotePropertyValue (Get-VDSNodeName -CloudId $Node)
            $Object | Add-Member -NotePropertyName 'TargetCloudId' -NotePropertyValue $Node

            $Object | Select-Object Source,SourceCloudId,Target,TargetCloudId,currentLatency,peakLatency

        } # end foreach
    } # end foreach
} # end function Get-VDSClusterLatency
