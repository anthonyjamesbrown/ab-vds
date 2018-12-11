---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSIcsJms

## SYNOPSIS
Get information and statistics about all topics in the messaging server for all topologies.

## SYNTAX

```
Get-VDSIcsJms [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information and statistics about all topics in the messaging server for all topologies.

The data returned includes:
AvgNumMsgs         : Average number of messages currently in the topic.
DiskUsed           : Current disk space used by the messages in the topic.
NumActiveConsumers : Number of consumers that subscribe to the topic.
NumMsgs            : Number of messages currently in the topic.
PeakMsgBytes       : Peak message size in bytes. 
TotalMsgBytes      : Total size of messages in bytes that are currently in the topic.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSIcsJms
```

Topology           : CF_DC_NEWCORP_DC_COM
CaptureConnector   : CF_DC_NEWCORP_DC_COM_so_dc_newcorp_dc_com_generic
NumMsgs            : 0
AvgNumMsgs         : 0
PeakMsgBytes       : 1129005
NumActiveConsumers : 1
TotalMsgBytes      : 0
DiskUsed           : 0

Topology           : CF_DC_NEWCORP_DC_COM
CaptureConnector   : CF_DC_NEWCORP_DC_COM_so_vdsconnector_cacherefresh_Hub
NumMsgs            : 0
AvgNumMsgs         : 0
PeakMsgBytes       : 1129796
NumActiveConsumers : 1
TotalMsgBytes      : 0
DiskUsed           : 0
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
Default value: (Get-VDSIcsLeaderName)
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
