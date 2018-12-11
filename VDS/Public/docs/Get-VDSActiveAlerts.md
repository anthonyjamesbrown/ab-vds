---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSActiveAlerts

## SYNOPSIS
Returns information about Active Alerts on the VDS cluster.

## SYNTAX

```
Get-VDSActiveAlerts [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information about all active alerts that are currently triggered. 
If the response is empty, this means there are 
currently no alerts triggered.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSActiveAlerts -Server ned
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
