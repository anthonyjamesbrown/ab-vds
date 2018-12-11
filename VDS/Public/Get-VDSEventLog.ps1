function Get-VDSEventLog
{
    <#
        .SYNOPSIS
            Get event log information about periodic persistent cache refresh events that fail.
        .DESCRIPTION
            This script returns information about periodic persistent cache refresh events for failed events.
            This script would need to be run on specific servers that you want to see event log data from.

            The following data is returned:
            date        : Timestamp providing the date and time the persistent cache refresh failure occurred.
            syncDiffPct : The percentage of which the validation threshold has been exceeded.  If the failure was not due to a validation threshold, 
                           then the value is -1. 
            levelName   : VDS log level associated with the error.
            message     : The error message associated with the persistent cache refresh failure.

            If there are no persistent cache refresh errors since the service started then this call will return null.
        .EXAMPLE
            PS> Get-VDSEventLog -Server wprnedifvds001v

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'event-log'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $Response
} # end function Get-VDSEventLog
