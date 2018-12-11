---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSCloudId

## SYNOPSIS
Returns the CloudId for a given vds node name.

## SYNTAX

```
Get-VDSCloudId [[-Server] <String>] [[-NodeName] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script will take a vds node name (server name) as a parameter and return the VDS cloudId for that node.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSCloudId -server 'ned' -NodeName 'wprnedifvds003v'
```

e9391e10-e62f-48ee-a8b1-93636f4b3e6d

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

### -NodeName
{{Fill NodeName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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
