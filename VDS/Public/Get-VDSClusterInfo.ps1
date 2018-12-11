function Get-VDSClusterInfo
{
    <#
        .SYNOPSIS
            Returns information and statistics about the cluster.
        .DESCRIPTION
            This script returns information and statistics about the targeted cluster.

            data             : The combined index size (in KB) of all of the HDAP stores in the cluster. This property requires an FID to be running 
                                in order to return information.
            icsLeader        : The cloud ID associated with the current ICS leader node in the cluster. This property does NOT require an FID to be 
                                running in order to return information.
            mqType           : Has a value of GF when the default JMS (non-HA) configuration is used. Has a value of JMSHA when JMS is configured for 
                                high-availability. Has a value of CUSTOM if JMS is not in HA and running somewhere other than on the default RadiantOne 
                                cluster nodes. This property does NOT require an FID to be running in order to return information.
            mqUrl            : URL indicating where the JMS is running/active (where GlassFish currently points to). This property does NOT require an 
                                FID to be running in order to return information.
            name             : The name of the cluster the node is a member of. This property does NOT require an FID to be running in order to return 
                                information.
            nodeCount        : The number of nodes in the cluster. This property does NOT require an FID to be running in order to return information.
            readOnly         : The value is true if ZooKeeper on the node is in a read-only state. The value is false if ZooKeeper on the node is a 
                                 read-write state. This property does NOT require an FID to be running in order to return information.
            storeCount       : The number of HDAP stores on the node. This property requires an FID to be running in order to return information.
            upTime           : The amount of time (in milliseconds) the RadiantOne FID service on the node has been running. This property does NOT 
                                require an FID to be running in order to return information.
            vdsIcsLeaderSame : The value is true if the node is the current RadiantOne FID leader and ICS leader. This value is false if the node 
                                is not the current ICS leader and FID leader. This property does NOT require an FID to be running in order to return 
                                information.
            vdsLeader        : The cloud ID associated with the current RadiantOne FID leader node in the cluster. This property requires an FID to 
                                be running in order to return information.
        .EXAMPLE
            PS> Get-VDSClusterInfo
            
            upTime           : 2729402668
            data             : 9774352
            vdsLeader        : aaeccabc-7af2-4fcf-b2db-020690112f5c
            vdsIcsLeaderSame : true
            name             : vds_sed
            storeCount       : 19
            nodeCount        : 3
            readOnly         : false
            icsLeader        : aaeccabc-7af2-4fcf-b2db-020690112f5c
            mqType           : GF
            mqUrl            : ["WPRSEDIFVDS001V.asurion.org:7676"]
            vdsLeaderName    : wprsedifvds003v.asurion.org
            icsLeaderName    : wprsedifvds003v.asurion.org

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'cluster-info'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if
    $Object = $Response
    
    $Object | Add-Member -NotePropertyName "vdsLeaderName" -NotePropertyValue (Get-VDSNodeName -CloudId $Object.vdsLeader)
    $Object | Add-Member -NotePropertyName "icsLeaderName" -NotePropertyValue (Get-VDSNodeName -CloudId $Object.icsLeader)

    $Object
} # end function Get-VDSClusterInfo
