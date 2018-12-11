---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Format-VDSServerName

## SYNOPSIS
Properly formats a short server or GTM name to a FQDN, if a valid FQDN is passed then it is returned unchanged.

## SYNTAX

```
Format-VDSServerName [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script will convert a short server or GTM name to a FQDN, if a valid FQDN is passed then it is returned unchanged.

## EXAMPLES

### EXAMPLE 1
```
Format-VDSServerName -Server wprnedifvds001v
```

wprnedifvds001v.asurion.org

### EXAMPLE 2
```
Format-VDSServerName -Server npr
```

npr.vds.prod.asurion.net

### EXAMPLE 3
```
Format-VDSServerName -Server wprnedifvds002v.asurion.org
```

wprnedifvds002v.asurion.org

## PARAMETERS

### -Server
{{Fill Server Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
