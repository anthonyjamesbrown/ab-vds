function Get-VDSCloudId
{
    <#
        .SYNOPSIS
            Returns the CloudId for a given vds node name.
        .DESCRIPTION
            This script will take a vds node name (server name) as a parameter and return the VDS cloudId for that node.
        .EXAMPLE
            PS> Get-VDSCloudId -server 'ned' -NodeName 'wprnedifvds003v'
            e9391e10-e62f-48ee-a8b1-93636f4b3e6d
        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net',
        [string]$NodeName
    ) # end param

    $CollectorKey = 'node-info'

    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    if($NodeName.EndsWith(".asurion.org") -eq $false)
    {
        $NodeName += '.asurion.org'
    } # end if

    if($NodeName -notmatch '^[a-zA-Z0-9]+\.asurion\.org$') 
    {
        Write-Warning "The nodename $NodeName is not a valid name."
        return
    } # end if

    $NodeHash = @{}
    $LevelOneProps = $Response.PSObject.Properties.Name

    $LevelOneProps | ForEach-Object {
        $Node = $Response."$_".cloudId
        $Value = $Response."$_".name
        $NodeHash.Add(($Node.ToLower()),$Value.ToLower())
    } # end ForEach

    $CloudId = Foreach ($Key in ($NodeHash.GetEnumerator() | Where-Object {$_.Value -eq $NodeName})) {$Key.name}
    $CloudId
} # end function Get-VDSCloudId
