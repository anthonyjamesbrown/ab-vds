function Get-VDSClusterLdap
{
    <#
        .SYNOPSIS
            Get information about the LDAP/LDAPS connectivity between VDS cluster nodes.
        .DESCRIPTION
            This script returns information about the current LDAP/LDAPS connectivity between VDS cluster nodes.
        .EXAMPLE
            PS> Get-VDSClusterLdap
            
            Source        : wprsedifvds002v.asurion.org
            SourceCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Target        : wprsedifvds002v.asurion.org
            TargetCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            ldap          : true
            ldaps         : true
            errors        : []

            Source        : wprsedifvds002v.asurion.org
            SourceCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Target        : wprsedifvds003v.asurion.org
            TargetCloudId : aaeccabc-7af2-4fcf-b2db-020690112f5c
            ldap          : true
            ldaps         : true
            errors        : []

            Source        : wprsedifvds002v.asurion.org
            SourceCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Target        : wprsedifvds001v.asurion.org
            TargetCloudId : a80969d3-0f8c-4e0f-9a09-0579e92023f1
            ldap          : NA
            ldaps         : NA
            errors        : []
            ...

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'cluster-ldap'

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

            $Object | Add-Member -NotePropertyName 'Source' -NotePropertyValue (Get-VDSNodeName -CloudId $RootNode)
            $Object | Add-Member -NotePropertyName 'SourceCloudId' -NotePropertyValue $RootNode
            $Object | Add-Member -NotePropertyName 'Target' -NotePropertyValue (Get-VDSNodeName -CloudId $Node)
            $Object | Add-Member -NotePropertyName 'TargetCloudId' -NotePropertyValue $Node

            $Object | Select-Object Source,SourceCloudId,Target,TargetCloudId,ldap,ldaps,errors

        } # end foreach
    } # end foreach
} # end function Get-VDSClusterLdap
