---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSEventLog

## SYNOPSIS
Get event log information about periodic persistent cache refresh events that fail.

## SYNTAX

```
Get-VDSEventLog [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information about periodic persistent cache refresh events for failed events.
This script would need to be run on specific servers that you want to see event log data from.

The following data is returned:
date        : Timestamp providing the date and time the persistent cache refresh failure occurred.
syncDiffPct : The percentage of which the validation threshold has been exceeded. 
If the failure was not due to a validation threshold, 
               then the value is -1. 
levelName   : VDS log level associated with the error.
message     : The error message associated with the persistent cache refresh failure.

If there are no persistent cache refresh errors since the service started then this call will return null.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSEventLog -Server wprnedifvds001v
```

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
