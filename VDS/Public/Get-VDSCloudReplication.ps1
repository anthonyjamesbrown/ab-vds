function Get-VDSCloudReplication
{
    <#
        .SYNOPSIS
            Return information about inter-cluster replication.
        .DESCRIPTION
            This script returns information and statistics about all configured inter-cluster replication.
        .EXAMPLE
            PS> Get-VDSCloudReplication

            vdsSyncCursor     : 13
            ensurePush        : false
            missingChanges    : 0
            errorCode         :
            lastChangeNum     : 25
            publishedChanges  : 0
            serverId          : 5184
            subscribedChanges : 0
            errors            : []
            CentralJournal    : vds_sed
            Cluster           : vds_ned
            NamingContext     : ou=jcadev,ou=apps,o=data
            ...

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'cloud-replication'

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
            
            $NamingContexts = $Response."$RootNode"."$Node".PSObject.Properties.Name
            $NamingContexts | ForEach-Object {

                $NamingContext = $_

                $Object = $Response."$RootNode"."$Node"."$NamingContext"

                $Object | Add-Member -NotePropertyName 'CentralJournal' -NotePropertyValue ($RootNode.Split("(")[1].Split(")")[0])
                $Object | Add-Member -NotePropertyName 'Cluster' -NotePropertyValue $Node
                $Object | Add-Member -NotePropertyName 'NamingContext' -NotePropertyValue $NamingContext

                $Object
            } # end foreach
        } # end foreach
    } # end foreach
} # end function Get-VDSCloudReplication
