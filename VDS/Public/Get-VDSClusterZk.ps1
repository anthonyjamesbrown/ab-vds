function Get-VDSClusterZk
{
    <#
        .SYNOPSIS
            Get information about ZooKeeper connectivity.
        .DESCRIPTION
            This script returns information about the current ZooKeeper connectivity, both on the local node and between cluster nodes.
            All healthy nodes should returin 'OK' for canRead and canWrite.
        .EXAMPLE
            PS> Get-VDSClusterZk    
            
            Source        : wprsedifvds003v.asurion.org
            SourceCloudId : aaeccabc-7af2-4fcf-b2db-020690112f5c
            Target        : wprsedifvds002v.asurion.org
            TargetCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            canRead       : OK
            canWrite      : OK
            errors        : { }

            Source        : wprsedifvds003v.asurion.org
            SourceCloudId : aaeccabc-7af2-4fcf-b2db-020690112f5c
            Target        : wprsedifvds003v.asurion.org
            TargetCloudId : aaeccabc-7af2-4fcf-b2db-020690112f5c
            canRead       : OK
            canWrite      : OK
            errors        : { }

            Source        : wprsedifvds003v.asurion.org
            SourceCloudId : aaeccabc-7af2-4fcf-b2db-020690112f5c
            Target        : wprsedifvds001v.asurion.org
            TargetCloudId : a80969d3-0f8c-4e0f-9a09-0579e92023f1
            canRead       : OK
            canWrite      : OK
            errors        : { }
            ...
        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'cluster-zk'

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

            $Object | Select-Object Source,SourceCloudId,Target,TargetCloudId,canRead,canWrite,errors

        } # end foreach
    } # end foreach
} # end function Get-VDSClusterZk
