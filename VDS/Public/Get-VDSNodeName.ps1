function Get-VDSNodeName
{
    <#
        .SYNOPSIS
            Returns the vds node name for a given cloudId.
        .DESCRIPTION
            This script will take a vds cloudId as a parameter and return the VDS node name.
        .EXAMPLE
            PS> Get-VDSNodeName -Server 'ned' -CloudId e9391e10-e62f-48ee-a8b1-93636f4b3e6d       
            wprnedifvds003v.asurion.org
        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net',
        [Parameter(
            Mandatory=$true
        )]
        [ValidatePattern('^[a-zA-Z0-9]{8}\-[a-zA-Z0-9]{4}\-[a-zA-Z0-9]{4}\-[a-zA-Z0-9]{4}\-[a-zA-Z0-9]{12}$')]
        [string]$CloudId
    ) # end param

    $Server = Format-VDSServerName -Server $Server

    $CollectorKey = 'node-info'
    $Response = Invoke-VDSAdminAPIRestMethod -Server $server -CollectorKey $CollectorKey

    if([string]::IsNullOrEmpty($Response))
    { 
        Write-Warning "There was an issue calling the Rest Endpoint, check the Server value and try again."
        return $null
    } # end if

    $NodeHash = @{}
    $LevelOneProps = $Response.PSObject.Properties.Name

    $LevelOneProps | ForEach-Object {
        $Node = $Response."$_".cloudId
        $Value = $Response."$_".name
        $NodeHash.Add(($Node.ToLower()),$Value.ToLower())
    } # end ForEach

    if($NodeHash.keys -contains $CloudId)
    {
        $NodeName = $NodeHash[$CloudId]
        $NodeName.ToLower()
    }
    else 
    {
        $null    
    } # end if
} # end fucntion Get-VDSNodeName 
