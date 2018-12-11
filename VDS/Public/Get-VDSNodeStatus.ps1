function Get-VDSNodeStatus
{
    <#
        .SYNOPSIS
            Get On/off status for each VDS service running on each cluster node.
        .DESCRIPTION
            This script returns the ON/OFF status for each service running on each cluster node.

            The following data is returned:
                glassfish_status : Status of the GlassFish application server on the node. A value of ON means GlassFish is running on the node. A value of OFF 
                                    indicates GlassFish is not running on the node.
                http_status      : Status of the VDS HTTP port. A value of ON means VDS is listening on the HTTP port. A value of OFF indicates 
                                    VDS is not listening on the HTTP port.
                https_status     : Status of the VDS HTTPS port. A value of ON means VDS is listening on the HTTPS (for SSL/TLS) port. A value of OFF indicates 
                                    VDS is not listening on the HTTPS (for SSL/TLS) port.
                ldap_status      : Status of the VDS LDAP port. A value of ON means VDS is listening on the LDAP port. A value of OFF indicates RadiantOne FID is
                                    not listening on the LDAP port.
                ldap_ssl_status  : Status of the VDS LDAPS port. A value of ON means VDS is listening on the LDAPS (for SSL/TLS) port. A value of OFF indicates
                                    VDS is not listening on the LDAPS (for SSL/TLS) port.
                mq_status        : Status of the JMS message queue in the cluster. A value of ON means OpenMQ (JMS) is running and accessible by VDS. It could be 
                                    running on any cluster node. A value of OFF indicates OpenMQ (JMS) is not running and inaccessible by VDS.
                vrs_ssl_status   : Status of the VDS JDBC SSL port. A value of ON means VDS is listening on the JDBC SSL port. A value of OFF indicates VDS is not 
                                    listening on the JDBC SSL port.
                vrs_status       : Status of the VDS JDBC port. A value of ON means VDS is listening on the JDBC port. A value of OFF indicates RadiantOne FID is 
                                    not listening on the JDBC port.
                zk_status        : Status of the ZooKeeper on the node. A value of ON means ZooKeeper is running on the node. A value of OFF indicates ZooKeeper is 
                                    not running on the node.            
        .EXAMPLE
            PS> Get-VDSNodeStatus
            ldap_status      : ON
            vrs_status       : OFF
            ldap_ssl_status  : ON
            zk_status        : ON
            mq_status        : ON
            http_status      : ON
            vrs_ssl_status   : OFF
            glassFish_status : OFF
            https_status     : ON
            Name             : wprsedifvds002v.asurion.org
            CloudId          : 914d3436-0f5f-4239-a76d-bcaaab111c95

            ldap_status      : ON
            vrs_status       : OFF
            ldap_ssl_status  : ON
            zk_status        : ON
            mq_status        : ON
            http_status      : ON
            vrs_ssl_status   : OFF
            glassFish_status : ON
            https_status     : ON
            Name             : wprsedifvds003v.asurion.org
            CloudId          : aaeccabc-7af2-4fcf-b2db-020690112f5c

            ldap_status      : ON
            vrs_status       : OFF
            ldap_ssl_status  : ON
            zk_status        : ON
            mq_status        : ON
            http_status      : ON
            vrs_ssl_status   : OFF
            glassFish_status : OFF
            https_status     : ON
            Name             : wprsedifvds001v.asurion.org
            CloudId          : a80969d3-0f8c-4e0f-9a09-0579e92023f1     
        
        .EXAMPLE
            PS> Get-VDSNodeStatus -NodeId a80969d3-0f8c-4e0f-9a09-0579e92023f1

            ldap_status      : ON
            vrs_status       : OFF
            ldap_ssl_status  : ON
            zk_status        : ON
            mq_status        : ON
            http_status      : ON
            vrs_ssl_status   : OFF
            glassFish_status : OFF
            https_status     : ON
            Name             : wprsedifvds001v.asurion.org
            CloudId          : a80969d3-0f8c-4e0f-9a09-0579e92023f1

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

    $CollectorKey = 'node-status'

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

        $Object | Add-Member -NotePropertyName 'Name' -NotePropertyValue (Get-VDSNodeName -CloudId $RootNode)
        $Object | Add-Member -NotePropertyName 'CloudId' -NotePropertyValue $RootNode

        $Object

    } # end foreach
} # end function Get-VDSNodeStatus
