function Format-VDSServerName
{
    <#
        .SYNOPSIS
            Properly formats a short server or GTM name to a FQDN, if a valid FQDN is passed then it is returned unchanged.
        .DESCRIPTION
            This script will convert a short server or GTM name to a FQDN, if a valid FQDN is passed then it is returned unchanged.
        .EXAMPLE
            PS> Format-VDSServerName -Server wprnedifvds001v
            wprnedifvds001v.asurion.org

        .EXAMPLE
            PS> Format-VDSServerName -Server npr
            npr.vds.prod.asurion.net

        .EXAMPLE
            PS> Format-VDSServerName -Server wprnedifvds002v.asurion.org
            wprnedifvds002v.asurion.org        

        .PARAMETER Sever
            This is the name of the server or GTM name to convert to a FQDN
            
            Valid server names would include
            - vds.prod.asurion.net
            - vds
            - ned.vds.prod.asurion.net
            - ned
            - sed.vds.prod.asurion.net
            - sed
            - npr.vds.prod.asurion.net
            - npr
            - wprnedifvds001.asurion.net 
            - wprnedifvds001
                - Same for all of the other vds server names
            
            Invalid server names would include the following
            - vds.net (Invalid FQDN)
            - etc...
    #>
    [CmdletBinding()]
    param(
        [String]$Server
    ) # end param 

    $Server = $Server.ToLower()

    if(($Server -eq 'vds.prod.asurion.net') -or ($Server -eq 'npr.vds.prod.asurion.net') -or 
        ($Server -eq 'ned.vds.prod.asurion.net') -or ($Server -eq 'sed.vds.prod.asurion.net')) 
    {
        return $server
    } # end if

    switch($Server)
    {
        'ned' {return 'ned.vds.prod.asurion.net'}
        'sed' {return 'sed.vds.prod.asurion.net'}
        'vds' {return 'vds.prod.asurion.net'}
        'npr' {return 'npr.vds.prod.asurion.net'}
    } # end switch

    if($Server -notcontains ".")
    {
        if($Server -match '^w(np|pr)(npr|ned|sed)ifvds00[0-9]v$')
        {
            $Server += '.asurion.org'
            return $Server
        }
        elseif($Server -match '^w(np|pr)(npr|ned|sed)ifvds00[0-9]v\.asurion\.org$')
        {
            return $Server
        }
        else
        {
            return $null    
        } # end if
    } # end if
} # end fucntion Format-VDSServerName
