function Get-VDSHdapStore
{
    <#
        .SYNOPSIS
            Get information and statistics about HDAP stores.
        .DESCRIPTION
            This script returns information and statistics about all HDAP stores and persistent cached branches.

            The following data is returned:
            folderSize       : Total size (in Bytes) of the file folder associated with the HDAP store/persistent cache (index, tlogs).
            indexName        : Internal name of the index associated with the HDAP store/persistent cache.
            indexSize        : Current size of the index (in KB) for the HDAP store/persistent cache.
            indexSizePeak    : Peak index size for the HDAP store/persistent cache since the VDS service started.
            numOfEntries     : Number of entries in the HDAP store/persistent cache.
            numOfEntriesPeak : Peak number of entries in the HDAP store/persistent cache since the VDS service started.
            searchOps        : Search operations per second.
            searchOpsPeak    : Search operations per second peak, since the VDS service started.
            version          : Current internal version of the store.  This is used to manage replication.
            writeOps         : Write operations per second.
            writeOpsPeak     : Write operations per second.

        .EXAMPLE
            PS> Get-VDSHdapStore       

            Name             : wprsedifvds002v.asurion.org
            CloudId          : 914d3436-0f5f-4239-a76d-bcaaab111c95
            NamingContext    : dc=int,dc=asurion,dc=com
            numOfEntries     : 183704
            writeOps         : 0.0
            numOfEntriesPeak : 183704
            indexName        : dc=int,dc=asurion,dc=com
            searchOps        : 0.0
            indexSizePeak    : 3698934.095703125
            writeOpsPeak     : 0.0
            folderSize       : 2132883673
            searchOpsPeak    : 0.4
            version          : 930d
            indexSize        : 2062362.2119140625

            Name             : wprsedifvds002v.asurion.org
            CloudId          : 914d3436-0f5f-4239-a76d-bcaaab111c95
            NamingContext    : ou=asurionmailbox,o=view
            numOfEntries     : 33934
            writeOps         : 0.0
            numOfEntriesPeak : 33934
            indexName        : ou=asurionmailbox,o=view
            searchOps        : 0.0
            indexSizePeak    : 122198.787109375
            writeOpsPeak     : 0.0
            folderSize       : 142203104
            searchOpsPeak    : 0.0
            version          : 1b5
            indexSize        : 118382.21875
            ...

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'hdap-store'

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

            $Object | Add-Member -NotePropertyName 'Name' -NotePropertyValue (Get-VDSNodeName -CloudId $RootNode)
            $Object | Add-Member -NotePropertyName 'CloudId' -NotePropertyValue $RootNode
            $Object | Add-Member -NotePropertyName 'NamingContext' -NotePropertyValue $Node

            $Object | Select-Object Name,CloudID,NamingContext,numOfEntries,writeOps,numOfEntriesPeak,indexName,searchOps,indexSizePeak,writeOpsPeak,folderSize,searchOpsPeak,version,indexSize

        } # end foreach
    } # end foreach
} # end function Get-VDSHdapStore
