---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSActiveLeaderNode

## SYNOPSIS
Returns the active VDS leader node in the active datacenter cluster

## SYNTAX

```
Get-VDSActiveLeaderNode [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script will determine which datacenter VDS cluster is currently active and then
interogate a node in that cluster to find the active FID Node leader.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSActiveLeaderNode
```

WPRNEDIFVDS003V.ASURION.ORG

## PARAMETERS

### -Server
This is the name of the server to connect to the REST API. 
The default is vds.prod.asurion.net which will resolve to a random node on
the active cluster.

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
