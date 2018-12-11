function Get-VDSIcsLeaderName
{
    <#
        .SYNOPSIS
            Get the current VDS ICS Leader node from the targeted cluster (target any node member in the cluster). 
        .DESCRIPTION
            This script will return the name of the current VDS ICS Leader node.  User the -Server parameter to target any member node in the cluster.
        .EXAMPLE
            PS> Get-VDSIcsLeaderName       
            wprsedifvds003v.asurion.org

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [String]$Server = 'vds.prod.asurion.net'
    ) # end param

    $ClusterInfo = Get-VDSClusterInfo -Server $Server

    $ClusterInfo.IcsLeaderName
}
