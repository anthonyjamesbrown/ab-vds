function Get-VDSActiveLeaderNode
{
    <#
        .SYNOPSIS
            Returns the active VDS leader node in the active datacenter cluster
        .DESCRIPTION
            This script will determine which datacenter VDS cluster is currently active and then
            interogate a node in that cluster to find the active FID Node leader.
        .EXAMPLE
            PS> Get-VDSActiveLeaderNode
            WPRNEDIFVDS003V.ASURION.ORG
        .PARAMETER Server
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [String]$Server = 'vds.prod.asurion.net'
    ) # end param

    $Server = Format-VDSServerName -Server $Server

    $CollectorKey = 'node-monitor'
    $PropertyId = 'isVdsLeader'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey -PropertyId $PropertyId

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $ServerHash = @{}
    $LevelOneProps = $Response.PSObject.Properties.Name

    $LevelOneProps | ForEach-Object {
        $Server = $Response."$_".PSObject.Properties.Name
        $Value = $Response."$_".$Server.isVdsLeader
        $ServerHash.Add(($Server.ToUpper()),$Value)
    } # end ForEach

    $Leader = Foreach ($Key in ($ServerHash.GetEnumerator() | Where-Object {$_.Value -eq $true})) {$Key.name}

    if(-not [string]::IsNullOrEmpty($Leader))
    {
        $Leader = $Leader.ToLower()
    } # end if
    $Leader
} # end Get-VDSActiveLeaderNode function
