---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Invoke-VDSAdminAPIRestMethod

## SYNOPSIS
Boiler plate function to make calls to the VDS Admin REST API.

## SYNTAX

```
Invoke-VDSAdminAPIRestMethod [[-Server] <String>] [[-CollectorKey] <String>] [[-Id] <String>]
 [[-PropertyId] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script is a boiler plate helping function for making calls to the VDS Admin REST API.

## EXAMPLES

### EXAMPLE 1
```
Return all nodes.
```

PS\> Invoke-VDSAdminAPIRestMethod -Server 'vds.prod.asurion.net' -CollectorKey 'node-info'

914d3436-0f5f-4239-a76d-bcaaab111c95
------------------------------------
@{installPath=E:\radiantone\vds; product=RadiantOne FID; javaVersion=1.8.0_161-b12; vdsBuild=v7.2.21.r44703-02012018-0410;...}

### EXAMPLE 2
```
Only Return a particular node.
```

PS\> Invoke-VDSAdminAPIRestMethod -Server 'vds.prod.asurion.net' -CollectorKey 'node-info' -id "a80969d3-0f8c-4e0f-9a09-0579e92023f1"

a80969d3-0f8c-4e0f-9a09-0579e92023f1
------------------------------------
@{installPath=E:\radiantone\vds; product=RadiantOne FID; javaVersion=1.8.0_161-b12; vdsBuild=v7.2.21.r44703-02012018-0410;...}

### EXAMPLE 3
```
Invoke-VDSAdminAPIRestMethod -server 'wprnedifvds001v' -CollectorKey 'node-info' -PropertyId 'cloudId'
```

e9391e10-e62f-48ee-a8b1-93636f4b3e6d            d898ba81-8d98-4ccc-961d-52b7d3b7153f            d1a64c18-00f2-485e-ba11-85db696a503b
------------------------------------            ------------------------------------            ------------------------------------
@{cloudId=e9391e10-e62f-48ee-a8b1-93636f4b3e6d} @{cloudId=d898ba81-8d98-4ccc-961d-52b7d3b7153f} @{cloudId=d1a64c18-00f2-485e-ba11-85db696a503b}

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

### -CollectorKey
This is the name of the CollectorKey value to query.
Acceptable collectorKey names are: active-alerts, cloud-replication, cluster-info, cluster-latency, cluster-ldap, cluster-zk,
connections-info, datasource-status, event-log, hdap-store, ics-jms, ics-sync, node-info, node-monitor, node-status, process-info
and server-event.

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

### -Id
This is the CloudId for a VDS Node. 
Only some of the collectorKeys accept this input, like the node-* keys.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PropertyId
This is the name of a specific proptery to return. 
This parameter does not work with the Id parameter.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
