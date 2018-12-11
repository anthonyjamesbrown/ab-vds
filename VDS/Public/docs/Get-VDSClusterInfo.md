---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSClusterInfo

## SYNOPSIS
Returns information and statistics about the cluster.

## SYNTAX

```
Get-VDSClusterInfo [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information and statistics about the targeted cluster.

data             : The combined index size (in KB) of all of the HDAP stores in the cluster.
This property requires an FID to be running 
                    in order to return information.
icsLeader        : The cloud ID associated with the current ICS leader node in the cluster.
This property does NOT require an FID to be 
                    running in order to return information.
mqType           : Has a value of GF when the default JMS (non-HA) configuration is used.
Has a value of JMSHA when JMS is configured for 
                    high-availability.
Has a value of CUSTOM if JMS is not in HA and running somewhere other than on the default RadiantOne 
                    cluster nodes.
This property does NOT require an FID to be running in order to return information.
mqUrl            : URL indicating where the JMS is running/active (where GlassFish currently points to).
This property does NOT require an 
                    FID to be running in order to return information.
name             : The name of the cluster the node is a member of.
This property does NOT require an FID to be running in order to return 
                    information.
nodeCount        : The number of nodes in the cluster.
This property does NOT require an FID to be running in order to return information.
readOnly         : The value is true if ZooKeeper on the node is in a read-only state.
The value is false if ZooKeeper on the node is a 
                     read-write state.
This property does NOT require an FID to be running in order to return information.
storeCount       : The number of HDAP stores on the node.
This property requires an FID to be running in order to return information.
upTime           : The amount of time (in milliseconds) the RadiantOne FID service on the node has been running.
This property does NOT 
                    require an FID to be running in order to return information.
vdsIcsLeaderSame : The value is true if the node is the current RadiantOne FID leader and ICS leader.
This value is false if the node 
                    is not the current ICS leader and FID leader.
This property does NOT require an FID to be running in order to return 
                    information.
vdsLeader        : The cloud ID associated with the current RadiantOne FID leader node in the cluster.
This property requires an FID to 
                    be running in order to return information.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSClusterInfo
```

upTime           : 2729402668
data             : 9774352
vdsLeader        : aaeccabc-7af2-4fcf-b2db-020690112f5c
vdsIcsLeaderSame : true
name             : vds_sed
storeCount       : 19
nodeCount        : 3
readOnly         : false
icsLeader        : aaeccabc-7af2-4fcf-b2db-020690112f5c
mqType           : GF
mqUrl            : \["WPRSEDIFVDS001V.asurion.org:7676"\]
vdsLeaderName    : wprsedifvds003v.asurion.org
icsLeaderName    : wprsedifvds003v.asurion.org

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
