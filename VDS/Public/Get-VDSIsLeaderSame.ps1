function Get-VDSIsLeaderSame
{
    <#
        .SYNOPSIS
            Get the status of if the same node is both the IcsLeader and VDSLeader.
        .DESCRIPTION
            This script returns a value of true is the IcsLeader and VdsLeader are running on the same node.  A value of false will be returned if
            the roles are running on different nodes in the cluster.  
        .EXAMPLE
            PS> Get-VDSIsLeaderSame
            true       

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [String]$Server = 'vds.prod.asurion.net'
    ) # end param

    $ClusterInfo = Get-VDSClusterInfo -Server $Server

    $ClusterInfo.vdsIcsLeaderSame
} # end function Get-VDSIsLeaderSame
