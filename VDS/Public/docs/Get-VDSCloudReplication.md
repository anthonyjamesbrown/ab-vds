---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSCloudReplication

## SYNOPSIS
Return information about inter-cluster replication.

## SYNTAX

```
Get-VDSCloudReplication [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information and statistics about all configured inter-cluster replication.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSCloudReplication
```

vdsSyncCursor     : 13
ensurePush        : false
missingChanges    : 0
errorCode         :
lastChangeNum     : 25
publishedChanges  : 0
serverId          : 5184
subscribedChanges : 0
errors            : \[\]
CentralJournal    : vds_sed
Cluster           : vds_ned
NamingContext     : ou=jcadev,ou=apps,o=data
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
