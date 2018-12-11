---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSClusterLatency

## SYNOPSIS
Returns information about cluster latency.

## SYNTAX

```
Get-VDSClusterLatency [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information about the current network latency and peak network latency both on the local node and between cluster nodes.

currentLatency : Current network latency (in milliseconds). 
This property requires an FID to be running in order to return information.
peakLatency    : Peak network latency (in milliseconds), since the RadiantOne FID service started.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSClusterLatency
```

Source         : wprsedifvds002v.asurion.org
SourceCloudId  : 914d3436-0f5f-4239-a76d-bcaaab111c95
Target         : wprsedifvds002v.asurion.org
TargetCloudId  : 914d3436-0f5f-4239-a76d-bcaaab111c95
currentLatency : 0
peakLatency    : 1578

Source         : wprsedifvds002v.asurion.org
SourceCloudId  : 914d3436-0f5f-4239-a76d-bcaaab111c95
Target         : wprsedifvds003v.asurion.org
TargetCloudId  : aaeccabc-7af2-4fcf-b2db-020690112f5c
currentLatency : 15
peakLatency    : 2078      
....

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
