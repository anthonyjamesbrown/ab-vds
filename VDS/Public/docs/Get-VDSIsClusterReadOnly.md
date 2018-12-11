---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSIsClusterReadOnly

## SYNOPSIS
Get the read/write status for the cluster.

## SYNTAX

```
Get-VDSIsClusterReadOnly [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns the read/write status for the cluster.
This script queries the Get-VDSClusterInfo cmdlet and pulls back the readOnly attribute.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSIsClusterReadOnly
```

false

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
