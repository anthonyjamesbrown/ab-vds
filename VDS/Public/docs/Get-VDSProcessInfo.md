---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSProcessInfo

## SYNOPSIS
Get process information and statistics about the VDS processing queues.

## SYNTAX

```
Get-VDSProcessInfo [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns process information and statistics about the VDS processing queues.

The following data is returned:
    CloudId              : CloudId for the VDS node.
    Name                 : Friendly server name of the VDS node.
    Process              : Name of the VDS process.
    Type                 : Type of process queue.
    opThreadPoolSizeMax  : The max number of threads configured for a pool.
    opThreadPoolSizePeak : The peak number of thread used in a pool over a 24-hour timeframe.
    opWaitingInQueue     : The number of threads currently waiting in queue.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSProcessInfo
```

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

## PARAMETERS

### -Server
{{Fill Server Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Vds.prod.asurion.net
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
