---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSIcsLeaderName

## SYNOPSIS
Get the current VDS ICS Leader node from the targeted cluster (target any node member in the cluster).

## SYNTAX

```
Get-VDSIcsLeaderName [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script will return the name of the current VDS ICS Leader node. 
User the -Server parameter to target any member node in the cluster.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSIcsLeaderName
```

wprsedifvds003v.asurion.org

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
