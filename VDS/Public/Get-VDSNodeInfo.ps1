function Get-VDSNodeInfo
{
    <#
        .SYNOPSIS
            Get general information about all VDS cluster nodes.
        .DESCRIPTION
            This script returns general information about all VDS cluster nodes.

            The following data is returned:
                cloudId      : The identifier of the VDS node.
                createdTime  : Time when the VDS node was created.
                installPath  : The product installation path.
                ip           : IP address of the machine.
                isEnabledSsl : Has a value of "yes" when SSL is enabled for the VDS service and a value of "no" when it is not enabled.
                javaHome     : The installation location of Java.
                javaVersion  : Java version used in VDS.
                license      : Type of license associated with the VDS product and the email address of the person the VDS product is licensed to.
                name         : The friendly name of the machine where VDS node is installed.
                nodeType     : Has a value of READ_WRITE if the node is a core cluster node and a value of READ_ONLY if the node is a follower-only
                                type of cluster node.
                port         : The port number for the LDAP access to VDS.
                portSsl      : The port number for the LDAPS access to VDS.
                product      : The name of the VDS product (license) installed.
                startTime    : Time when VDS was started on the node.
                vdsBuild     : Exact VDS build id.
                vdsVersion   : Version of VDS installed.
        .EXAMPLE
            PS> Get-VDSNodeInfo       

            installPath : E:\radiantone\vds
            product     : RadiantOne FID
            javaVersion : 1.8.0_161-b12
            vdsBuild    : v7.2.21.r44703-02012018-0410
            ip          : 10.5.94.179
            isEnableSsl : YES
            portSsl     : 636
            nodeType    : READ_WRITE
            javaHome    : E:\radiantone\vds\jdk\jre
            currentTime : Tue Nov 20 14:25:01 EST 2018
            license     : Full, licensed to matt.chambers@asurion.com
            port        : 2389
            cloudId     : 914d3436-0f5f-4239-a76d-bcaaab111c95
            name        : WPRSEDIFVDS002V.asurion.org
            createdTime : Thu Aug 10 14:14:42 EDT 2017
            vdsVersion  : 7.2.21.r44703
            startTime   : Thu Nov 08 22:24:56 EST 2018
            ...

        .EXAMPLE
            PS> Get-VDSNodeInfo -NodeId a80969d3-0f8c-4e0f-9a09-0579e92023f1
            
            installPath : E:\radiantone\vds
            product     : RadiantOne FID
            javaVersion : 1.8.0_161-b12
            vdsBuild    : v7.2.21.r44703-02012018-0410
            ip          : 10.5.94.170
            isEnableSsl : YES
            portSsl     : 636
            nodeType    : READ_WRITE
            javaHome    : E:\radiantone\vds\jdk\jre
            currentTime : Wed Nov 21 09:53:52 EST 2018
            license     : Full, licensed to matt.chambers@asurion.com
            port        : 2389
            cloudId     : a80969d3-0f8c-4e0f-9a09-0579e92023f1
            name        : WPRSEDIFVDS001V.asurion.org
            createdTime : Thu Aug 10 14:14:42 EDT 2017
            vdsVersion  : 7.2.21.r44703
            startTime   : Fri Oct 19 02:40:28 EDT 2018

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.

        .PARAMETER NodeId
            This is the nodeId to only return the node details for a specific node.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net',
        [string]$NodeId
    ) # end param

    $CollectorKey = 'node-info'

    If($PSBoundParameters.ContainsKey('NodeId') -and $NodeId)
    {
        $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey -Id $NodeId
    }
    else
    {
        $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey
    } # end if

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $LevelOneProps = $Response.PSObject.Properties.name
    
    $LevelOneProps | ForEach-Object {
        $RootNode = $_

        $Object = $Response."$RootNode"
        $Object
    } # end foreach

} # end function Get-VDSNodeInfo
