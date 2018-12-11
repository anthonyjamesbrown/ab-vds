---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSServerEvent

## SYNOPSIS
Get the last 15 entries in the server event log file.

## SYNTAX

```
Get-VDSServerEvent [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns the last 15 entries in the server event log file (\<RLI_HOME\>/vds_server/logs/vds_events.log).

## EXAMPLES

### EXAMPLE 1
```
Get-VDSServerEvent
```

1       : Frontend started.
2       : Server started.
Name    : wprsedifvds002v.asurion.org
CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
Date    : 2018-11-08 22:25:31.465
Type    : INFO

3       : Node 914d3436-0f5f-4239-a76d-bcaaab111c95 is up, register tlog replication.
Name    : wprsedifvds002v.asurion.org
CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
Date    : 2018-11-08 22:25:33.996
Type    : INFO

4       : IndexHTTPFollower - \[dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\\\] Closing index with 215996 entries
Name    : wprsedifvds002v.asurion.org
CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
Date    : 2018-11-08 22:31:37.383
Type    : INFO

6       : IndexFollower - \[dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\\\] doUpdateOffline(): session=id=2 version=1 files={index=\[fileName=_0.cfe size=405 crc=2306564232,
        fileName=_0.si size=373 crc=1543502431, fileName=_0.cfs size=1394074533 crc=1662767082, fileName=segments_1 size=136 crc=3673080043\]}
7       : IndexFollower - \[dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\\\] doUpdateOffline(): requiredFiles=\[fileName=_0.cfe size=405 crc=2306564232, fileName=_0.si size=373
        crc=1543502431, fileName=_0.cfs size=1394074533 crc=1662767082, fileName=segments_1 size=136 crc=3673080043\]
8       : IndexFollower - \[dc_int_dc_asurion_dc_com - FS:E:\radiantone\vds\vds_server\data\dc_int_dc_asurion_dc_com\\\] doUpdateOffline(): replicating file=_0.cfe
Name    : wprsedifvds002v.asurion.org
CloudId : 914d3436-0f5f-4239-a76d-bcaaab111c95
Date    : 2018-11-08 22:34:49.106
Type    : INFO
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
