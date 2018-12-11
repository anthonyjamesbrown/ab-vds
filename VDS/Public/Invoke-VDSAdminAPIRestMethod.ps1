function Invoke-VDSAdminAPIRestMethod
{
     <#
        .SYNOPSIS
            Boiler plate function to make calls to the VDS Admin REST API.
        .DESCRIPTION
            This script is a boiler plate helping function for making calls to the VDS Admin REST API.  
        .EXAMPLE
            Return all nodes.

            PS> Invoke-VDSAdminAPIRestMethod -Server 'vds.prod.asurion.net' -CollectorKey 'node-info'

            914d3436-0f5f-4239-a76d-bcaaab111c95
            ------------------------------------
            @{installPath=E:\radiantone\vds; product=RadiantOne FID; javaVersion=1.8.0_161-b12; vdsBuild=v7.2.21.r44703-02012018-0410;...}

        .EXAMPLE
            Only Return a particular node.

            PS> Invoke-VDSAdminAPIRestMethod -Server 'vds.prod.asurion.net' -CollectorKey 'node-info' -id "a80969d3-0f8c-4e0f-9a09-0579e92023f1"

            a80969d3-0f8c-4e0f-9a09-0579e92023f1
            ------------------------------------
            @{installPath=E:\radiantone\vds; product=RadiantOne FID; javaVersion=1.8.0_161-b12; vdsBuild=v7.2.21.r44703-02012018-0410;...}

        .EXAMPLE
            PS> Invoke-VDSAdminAPIRestMethod -server 'wprnedifvds001v' -CollectorKey 'node-info' -PropertyId 'cloudId'
            e9391e10-e62f-48ee-a8b1-93636f4b3e6d            d898ba81-8d98-4ccc-961d-52b7d3b7153f            d1a64c18-00f2-485e-ba11-85db696a503b
            ------------------------------------            ------------------------------------            ------------------------------------
            @{cloudId=e9391e10-e62f-48ee-a8b1-93636f4b3e6d} @{cloudId=d898ba81-8d98-4ccc-961d-52b7d3b7153f} @{cloudId=d1a64c18-00f2-485e-ba11-85db696a503b}       

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
        .PARAMETER CollectorKey
            This is the name of the CollectorKey value to query.
            Acceptable collectorKey names are: active-alerts, cloud-replication, cluster-info, cluster-latency, cluster-ldap, cluster-zk,
            connections-info, datasource-status, event-log, hdap-store, ics-jms, ics-sync, node-info, node-monitor, node-status, process-info
            and server-event.
        .PARAMETER Id
            This is the CloudId for a VDS Node.  Only some of the collectorKeys accept this input, like the node-* keys.
        .PARAMETER PropertyId
            This is the name of a specific proptery to return.  This parameter does not work with the Id parameter.
    #>   
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net',
        [string]$CollectorKey,
        [ValidatePattern('^[a-zA-Z0-9]{8}\-[a-zA-Z0-9]{4}\-[a-zA-Z0-9]{4}\-[a-zA-Z0-9]{4}\-[a-zA-Z0-9]{12}$')]
        [string]$Id,
        [string]$PropertyId
    ) # end param

    $Server = Format-VDSServerName -Server $Server
    $CollectorKey = $CollectorKey.ToLower()

    $Uri = "http://$Server`:9100/adminapp/data/collect/$CollectorKey"

    If($PSBoundParameters.ContainsKey('Id') -and $Id)
    {
        $uri += "/nodeId:$Id"
    } # end if

    If($PSBoundParameters.ContainsKey('PropertyID') -and $PropertyId)
    {
        $uri += "/propertyId:$PropertyId"
    } # end if

    $Response = $null
    try
    {
        $Response = Invoke-RestMethod -Uri $URI -Method GET
    }
    catch [System.Exception]
    {
        Write-Warning -Message "Failed to make call to $Uri - $($_.exception.message)"
        return $null
    } # end try/catch call Invoke-RestMethod

    $Response
} # end function Invoke-VDSAdminAPIRestMethod
