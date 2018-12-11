function Get-VDSProcessInfo
{
    <#
        .SYNOPSIS
            Get process information and statistics about the VDS processing queues.
        .DESCRIPTION
            This script returns process information and statistics about the VDS processing queues.

            The following data is returned:
                CloudId              : CloudId for the VDS node.
                Name                 : Friendly server name of the VDS node.
                Process              : Name of the VDS process.
                Type                 : Type of process queue.
                opThreadPoolSizeMax  : The max number of threads configured for a pool.
                opThreadPoolSizePeak : The peak number of thread used in a pool over a 24-hour timeframe.
                opWaitingInQueue     : The number of threads currently waiting in queue.

        .EXAMPLE
            PS> Get-VDSProcessInfo
            
            opThreadExecuting    : 0
            opWaitingInQueue     : 0
            opThreadPoolSizeMax  : 640
            opThreadPoolSizePeak : 2
            Name                 : wprsedifvds002v.asurion.org
            CloudId              : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Process              : ProcessSSLQ_INTL
            Type                 : internal

            opThreadExecuting    : 0
            opWaitingInQueue     : 0
            opThreadPoolSizeMax  : 640
            opThreadPoolSizePeak : 4
            Name                 : wprsedifvds002v.asurion.org
            CloudId              : 914d3436-0f5f-4239-a76d-bcaaab111c95
            Process              : ProcessQ_INTL
            Type                 : internal            
            ...

        .PARAMETER Sever
            This is the name of the server to connect to the REST API.  The default is vds.prod.asurion.net which will resolve to a random node on
            the active cluster.
    #>
    [CmdletBinding()]
    param(
        [string]$Server = 'vds.prod.asurion.net'
    ) # end param

    $CollectorKey = 'process-info'

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
            $ThirdLevelNode = $Response."$RootNode"."$Node".PSObject.Properties.Name
            $ThirdLevelNode | ForEach-Object {
                $Object = $Response."$RootNode"."$Node"."$ThirdLevelNode"
                $Object | Add-Member -NotePropertyName 'Name' -NotePropertyValue (Get-VDSNodeName -CloudId $RootNode)
                $Object | Add-Member -NotePropertyName 'CloudId' -NotePropertyValue $RootNode
                $Object | Add-Member -NotePropertyName 'Process' -NotePropertyValue $Node
                $Object | Add-Member -NotePropertyName "Type" -NotePropertyValue $ThirdLevelNode

                $Object 
            }
        } # end foreach
    } # end foreach
} # end function Get-VDSProcessInfo
