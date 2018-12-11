---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSIsLeaderSame

## SYNOPSIS
Get the status of if the same node is both the IcsLeader and VDSLeader.

## SYNTAX

```
Get-VDSIsLeaderSame [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns a value of true is the IcsLeader and VdsLeader are running on the same node. 
A value of false will be returned if
the roles are running on different nodes in the cluster.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSIsLeaderSame
```

true

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
