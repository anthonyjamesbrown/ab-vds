function Get-VDSActiveAlerts
{
    <#
        .SYNOPSIS
            Returns information about Active Alerts on the VDS cluster.
        .DESCRIPTION
            This script returns information about all active alerts that are currently triggered.  If the response is empty, this means there are 
            currently no alerts triggered.
        .EXAMPLE
            PS> Get-VDSActiveAlerts -Server ned

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'active-alerts'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $Response
} # end function Get-VDSActiveAlerts
