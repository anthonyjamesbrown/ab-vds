---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSNodeName

## SYNOPSIS
Returns the vds node name for a given cloudId.

## SYNTAX

```
Get-VDSNodeName [[-Server] <String>] [-CloudId] <String> [<CommonParameters>]
```

## DESCRIPTION
This script will take a vds cloudId as a parameter and return the VDS node name.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSNodeName -Server 'ned' -CloudId e9391e10-e62f-48ee-a8b1-93636f4b3e6d
```

wprnedifvds003v.asurion.org

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

### -CloudId
{{Fill CloudId Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
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
