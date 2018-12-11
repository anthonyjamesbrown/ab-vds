---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSNodeMonitor

## SYNOPSIS
Get statistics about VDS nodes.

## SYNTAX

```
Get-VDSNodeMonitor [[-Server] <String>] [[-NodeId] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns statistics about VDS nodes.

The following data is returned:
    activeConnections                : Number of current connections to the VDS node.
    committedVirtualMemorySize       : Amount of virtual memory that is guaranteed to be available to the running process in bytes, 
                                        or -1 if this operation is not supported.
    connectionMax                    : Number of maximum connections currently configured for VDS.
    connectionPeak                   : Greatest amount of connections at one time to VDS in a 24-hour timeframe.
    connectionPercent                : Current percentage of maximum connections in use.
    connectionTotal                  : Total number of current connections to the VDS node.
    cpu                              : Current percentage of system CPU utilized.
    cpuAvg                           : Average percentage of system CPU utilized.
    cpuPeak                          : Highest percentage of system CPU utilized at one time in a 24-hour timeframe.
    disk                             : Current amount of disk space (in bytes) being used on the entire system.
    diskLatency                      : Latency in milliseconds of a write to disk operation.
    diskLatencyPeak                  : The peak disk latency calculated during a 24-hour period.
    diskPeak                         : Greatest amount of disk space (in bytes) used on teh entire system in a 24-hour timeframe.
    diskPercent                      : Percentage of disk space used on entire system.
    diskTotal                        : Total amount of disk space used on the entire system.
    isControlPanelRunning            : A value of true indicates that the Jetty Web server hosting the Control Panel is running. 
A Value
                                        of false indicates that the Jetty Web server is not running.
    isLcsLeader                      : A value of true indicates GlassFish is running on the node. 
A value of false, indicates GlassFish is not 
                                        running on the node.
    isVdsLeader                      : A value of true indicates the VDS service running on the node is the current cluster leader. 
A value of false
                                        indicates the VDS service running on the node is not the cluster leader.
    isVdsRunning                     : A value of true indicates the VDS service is running on the node. 
A value of false indicates that the VDS
                                        service on the node is not running.
    jvmThreadCount                   : Curent number of live threads including both daemon and non-daemon threads.
    memoryAlloc                      : Amount of memory currently allocated by JVM in kilobytes.
    memoryMax                        : Maximum amount of memory (in KB) that the VDS JVM is allowed to allocate.
    memoryPeak                       : Greatest amount of memory used by the VDS JVM at one time in a 24-hour timeframe.
    memoryPercent                    : Percentage of VDS JVM max memory used.
    memoryUsed                       : Amount of memory in use (in KB) by the VDS JVM.
    operationTotal                   : Total amount of LDAP operations performed on the VDS server.
    systemLoadAverage                : The system load average for the last minute. 
The system load average is the sum of the munber of runnable
                                        entities queued to the available processors averaged over a period of time. 
The way in which the load
                                        average is calculated is operating system specific but is typically a damped time-dependent average.
    systemOpenFileDescriptors        : Number of currently open file descriptors. 
(only availabe when deployed on Linux, Sorry!)
    systemOpenFileDescriptorsPercent : Current percentage of available open file descriptors in use. 
(only available when deployed on Linux, Sorry!)
    systemUsedPhysicalMemory         : Amount of physical memory (in bytes) used by the system.
    systemUsedPhysicalMemoryPercent  : Percentage of physical memory used by system.
    systemUsedSwap                   : Amount of used swap space in bytes.
    systemUsedSwapPercent            : Percentage of system swap space used.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSNodeMonitor | Where-Object name -eq wprsedifvds001v.asurion.org
```

systemUsedSwapPercent            : 42
connectionTotal                  : 560
isIcsLeader                      : false
memoryPercent                    : 14.3
diskTotal                        : 107371032576
memoryMax                        : 5592576
isVdsRunning                     : true
memoryUsed                       : 799681
systemOpenFileDescriptorsPercent : n/a
connectionMax                    : 1000
committedVirtualMemorySize       : 10743685120
connectionPercent                : 3.0
jvmThreadCount                   : 291
memoryPeak                       : 1020757
memoryAlloc                      : 1037312
cpuPeak                          : 63
cpuAvg                           : 4
systemUsedPhysicalMemoryPercent  : 77
diskLatency                      : 0
operationTotal                   : 34690560
diskLatencyPeak                  : 2
cpu                              : 4
isControlPanelRunning            : true
connectionPeak                   : 34
disk                             : 56285106176
systemUsedSwap                   : 21142867968
isVdsLeader                      : false
systemLoadAverage                : -1.0
systemOpenFileDescriptors        : n/a
activeConnections                : 30
diskPeak                         : 57167708160
diskPercent                      : 52.42
systemUsedPhysicalMemory         : 19987066880
CloudId                          : a80969d3-0f8c-4e0f-9a09-0579e92023f1
Name                             : WPRSEDIFVDS001V.asurion.org

### EXAMPLE 2
```
Get-VDSNodeMonitor -NodeId a80969d3-0f8c-4e0f-9a09-0579e92023f1
```

systemUsedSwapPercent            : 43
connectionTotal                  : 351
isIcsLeader                      : false
memoryPercent                    : 16.09
diskTotal                        : 107371032576
memoryMax                        : 5592576
isVdsRunning                     : true
memoryUsed                       : 900118
systemOpenFileDescriptorsPercent : n/a
connectionMax                    : 1000
committedVirtualMemorySize       : 11104841728
connectionPercent                : 2.8
jvmThreadCount                   : 290
memoryPeak                       : 1020419
memoryAlloc                      : 1036800
cpuPeak                          : 67
cpuAvg                           : 6
systemUsedPhysicalMemoryPercent  : 77
diskLatency                      : 0
operationTotal                   : 35268777
diskLatencyPeak                  : 1
cpu                              : 8
isControlPanelRunning            : true
connectionPeak                   : 35
disk                             : 54560432128
systemUsedSwap                   : 21599408128
isVdsLeader                      : false
systemLoadAverage                : -1.0
systemOpenFileDescriptors        : n/a
activeConnections                : 28
diskPeak                         : 56129531904
diskPercent                      : 50.81
systemUsedPhysicalMemory         : 19960332288
CloudId                          : a80969d3-0f8c-4e0f-9a09-0579e92023f1
Name                             : WPRSEDIFVDS001V.asurion.org

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

### -NodeId
This is the nodeId to only return the node details for a specific node.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
