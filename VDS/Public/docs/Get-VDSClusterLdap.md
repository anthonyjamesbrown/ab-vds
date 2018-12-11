---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSClusterLdap

## SYNOPSIS
Get information about the LDAP/LDAPS connectivity between VDS cluster nodes.

## SYNTAX

```
Get-VDSClusterLdap [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information about the current LDAP/LDAPS connectivity between VDS cluster nodes.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSClusterLdap
```

Source        : wprsedifvds002v.asurion.org
SourceCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
Target        : wprsedifvds002v.asurion.org
TargetCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
ldap          : true
ldaps         : true
errors        : \[\]

Source        : wprsedifvds002v.asurion.org
SourceCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
Target        : wprsedifvds003v.asurion.org
TargetCloudId : aaeccabc-7af2-4fcf-b2db-020690112f5c
ldap          : true
ldaps         : true
errors        : \[\]

Source        : wprsedifvds002v.asurion.org
SourceCloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
Target        : wprsedifvds001v.asurion.org
TargetCloudId : a80969d3-0f8c-4e0f-9a09-0579e92023f1
ldap          : NA
ldaps         : NA
errors        : \[\]
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
