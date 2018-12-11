function Get-VDSIsClusterReadOnly
{
    <#
        .SYNOPSIS
            Get the read/write status for the cluster.
        .DESCRIPTION
            This script returns the read/write status for the cluster. This script queries the Get-VDSClusterInfo cmdlet and pulls back the readOnly attribute.
        .EXAMPLE
            PS> Get-VDSIsClusterReadOnly
            false       

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [String]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'cluster-info'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $Response.readOnly
} # end function Get-VDSIsClusterReadOnly
