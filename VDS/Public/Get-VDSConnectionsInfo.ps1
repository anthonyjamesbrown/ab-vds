function Get-VDSConnectionsInfo
{
    <#
        .SYNOPSIS
            Get information about the current connections for a given VDS node.
        .DESCRIPTION
            This script returns information about the current connections for a given VDS node.

            If you -Server parameter is used then this request will run against the Active Leader node in the active datacenter.  This command is 
            one where you may want to use specific servers.

            The following data is returned:
            connBindDn      : Bind DN associated with the client connection.
            connClientIp    : Client IP address that established the connection.
            connClientPort  : Port number the client established the connection from.
            connId          : Unique identifier associated with the client connection.
            connServerIp    : IP address of the VDS node the client is connected to.
            connServerPort  : Port that the client connection is accessing VDS on.
            opCount         : The total number of operations the VDS node has processed for the connection.
            opCountAbandon  : Number of abandon operations performed on this connection.
            opCountAdd      : Number of add operations performed on this connection.
            opCountBind     : Number of bind operations performed on this connection.
            opCountCompare  : Number of compare operations performed on this connection.
            opCountDelete   : Number of delete operations performed on this connection.
            opCountModify   : Number of modify operations performed on this connection.
            opCountModifyDN : Number of modifyDN operations performed on this connection.
            opCoundSearch   : Number of searches performed on this connection.

        .EXAMPLE
            PS> Get-VDSConnectionsInfo -Server wprsedifvds002v.asurion.org       

            Name            : wprsedifvds002v.asurion.org
            CloudId         : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Id              : 236840
            opCountSearch   : 6769
            opCountAdd      : 0
            opCountAbandon  : 0
            connClientIp    : 10.5.94.10
            connClientPort  : 51865
            opCountBind     : 1
            opCountModify   : 0
            connBindDn      : CN=svc.us-p-sso-ldap,OU=SSO,OU=NA-Nashville,OU=service,OU=accounts,DC=int,DC=asurion,DC=com
            opCountModifyDn : 0
            opCountCompare  : 0
            connServerIp    : 10.5.94.179
            connId          : 236840
            opCount         : 6770
            opCountDelete   : 0
            connServerPort  : 636

            Name            : wprsedifvds002v.asurion.org
            CloudId         : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Id              : 139866
            opCountSearch   : 10749
            opCountAdd      : 0
            opCountAbandon  : 0
            connClientIp    : 10.5.94.10
            connClientPort  : 50449
            opCountBind     : 1
            opCountModify   : 0
            connBindDn      : CN=svc.us-p-sso-ldap,OU=SSO,OU=NA-Nashville,OU=service,OU=accounts,DC=int,DC=asurion,DC=com
            opCountModifyDn : 0
            opCountCompare  : 0
            connServerIp    : 10.5.94.179
            connId          : 139866
            opCount         : 10750
            opCountDelete   : 0
            connServerPort  : 636
            ...
        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'connections-info'

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
            $Object | Add-Member -NotePropertyName 'Id' -NotePropertyValue $Node

            $Object | Select-Object Name,CloudId,Id,opCountSearch,opCountAdd,opCountAbandon,connClientIp,connClientPort,opCountBind,opCountModify,connBindDn,opCountModifyDn,opCountCompare,connServerIp,connId,opCount,opCountDelete,connServerPort

        } # end foreach
    } # end foreach
} # end function Get-VDSConnectionInfo
