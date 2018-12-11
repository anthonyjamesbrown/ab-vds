function Get-VDSDataSourceStatus
{
    <#
        .SYNOPSIS
            Gets datasource connection status based on the target -Server node.
        .DESCRIPTION
            This script returns information about the data source and its status based on if the VDS node can connect to it.
            
            The following information is returned:
            Type          : Has a value of LDAP, JDBC, or Custom depending on the datasource.
            DatasourceURL : The URL configured for the data source.
            Status        : A value of false indicates the VDS on the node cannot connect to the data source.  A value of true indicates
                             VDS on the node can successfully connect to the data source.  A value of N/A indicates the connection cannot be
                             tested, which is the case for custom data sources. 
        .EXAMPLE
            PS> Get-VDSDatasourceStatus -Server wprnedifvds001v  
            
            Datasource         Type   DatasourceUrl                                                    Status
            ----------         ----   -------------                                                    ------
            remotefiles        CUSTOM N/A                                                              false
            concur             CUSTOM https://www.concursolutions.com/api/user/v1.0/User               false
            components         CUSTOM N/A                                                              false
            gdatacontacts      CUSTOM N/A                                                              false
            hqdomain           LDAP   ldaps://nedadint701.int.asurion.com:636/dc=int,dc=asurion,dc=com true
            googledirectory    CUSTOM N/A                                                              false
            vds                LDAP   ldaps://WPRNEDIFVDS001V.asurion.org:636/o=vds                    true
            asurion            LDAP   ldaps://wprnedifads001v.asurion.org:636/dc=asurion,dc=org        true
            new_sterling       LDAP   ldaps://wpdc2tn-vm.newcorp.com:636/dc=newcorp,dc=com             true
            replicationjournal LDAP   ldaps://sed.vds.prod.asurion.net:636/                            true
            sharepoint         CUSTOM https://10.11.5.112/_vti_bin/userprofileservice.asmx             false
            workdayhr          CUSTOM workdayurl                                                       false
            graphapi           CUSTOM https://graph.windows.net/seradiant.onmicrosoft.com              false
            salesforce         CUSTOM N/A                                                              false
            vdsha              LDAP   ldap://WPRNEDIFVDS002V.asurion.org:2389/                         true
            scimclient2        CUSTOM http://localhost:8089/scim2/o=companydirectory/v2                false
            graphapib2c        CUSTOM https://graph.windows.net/seradiant.onmicrosoft.com              false
            scimclient         CUSTOM http://localhost:8089/scim/o=companydirectory/v1                 false
            hdfs               CUSTOM N/A                                                              false
            log2db             JDBC   jdbc:derby://WPRNEDIFVDS001V.asurion.org:1527/log2db             false
            sharepointonline   CUSTOM https://myrltestdomain-admin.sharepoint.com                      false
            acsclient          CUSTOM 10.11.1.50                                                       false
            oktaclient         CUSTOM https://your_org.okta.com                                        false

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'datasource-status'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $LevelOneProps = $Response.PSObject.Properties.name

    $ResultsObject = @()

    $LevelOneProps | ForEach-Object {
        $RootNode = $_
        $TypeInt = $Response."$RootNode".datasourceTypeInt
        $DataSourceUrl = $Response."$RootNode".datasourceUrl
        $Status = $Response."$RootNode".status
        $Type = ""

        switch($TypeInt)
        {
            1 { $Type = "LDAP" }
            3 { $Type = "JDBC" }
            7 { $Type = "CUSTOM" }
        } # end switch

        $ResultsObject += [PSCustomObject]@{
            'Datasource' = $RootNode
            'Type' = $Type
            'DatasourceUrl' = $DataSourceUrl
            'Status' = $Status
        } # end object
    } # end foreach

    $ResultsObject
} # end function Get-VDSDataSourceStatus
