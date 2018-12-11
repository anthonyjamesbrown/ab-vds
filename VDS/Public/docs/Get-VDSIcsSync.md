---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSIcsSync

## SYNOPSIS
Get information and statistics about all ICS topologies.

## SYNTAX

```
Get-VDSIcsSync [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information and statistics about all ICS topologies and their corresponding components including their current
state.

The data object model follows this pattern:
object
==\> \<Topology Name\>
    ==\> generic (so_o_ldap)
        ==\> connectorType : Capture \[LDAP\]
        ==\> captureState : started
        ==\> totalMsgsProcessedByApply : 0
        ==\> totalMsgsProcessedByCapture : 3
    ==\> cacherefresh (so_vdsconnector)
        ==\> connectorType : Apply
        ==\> totalMsgsProcessedByApply : 3
        ==\> applyState : started
        ==\> totalMsgsProcessedByCapture : 0
    ==\> from_generic_to_cacherefresh.java
        ==\> source : generic (so_o_ldap)
        ==\> state : started
        ==\> target : cacherefresh (so_vdsconnector)
        ==\> totalMsgsProcessed : 3

The following data is returned:
    applyState                  : Indicates the state of the apply connector. 
Possible values are: started, \[error\]started, stopped, \[error\]stopped,
                                   suspended, \[error\]suspended, stopping, suspended_by_user, suspending_by_user, suspending.
    captureState                : Indicates the state of the capure connector. 
Possible values are: started, \[error\]started, stopped, \[error\]stopped,
                                   suspended, \[error\]suspended, stopping, suspended_by_user, suspending_by_user, suspending.
    connectorType               : A value of Capture \[type of data source\] indicates it is a source connector that captures changes. 
A valule of 
                                   Apply \[type of data source\] indicates it is a target connector that applies changes.
    source                      : Applicable for transformations only. 
Indicates the target object the transformation is publishing messages to.
    state                       : Applicable for transformations only. 
Indicates Started if the tranformation is running or Stopped if the 
                                   transformation is stopped.
    target                      : Applicable for transformations only. 
Indicates the target object the transformation is publishing messages to.
    totalMsgsProcessed          : Number of messages processed by the transformation.
    totalMsgsProcessedByApply   : Number of messages processed by an apply connector.
    totalMsgsProcessedByCapture : Number of messages processed by a source capture connector.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSIcsSync
```

CF_DC_NEWCORP_DC_COM        : @{generic (so_dc_newcorp_dc_com)=; cacherefresh (so_vdsconnector)=; from_generic_to_cacherefresh.java=}
CF_DC_ASURION_DC_ORG        : @{generic (so_dc_asurion_dc_org)=; cacherefresh (so_vdsconnector)=; from_generic_to_cacherefresh.java=}
CF_DC_INT_DC_ASURION_DC_COM : @{generic (so_dc_int_dc_asurion_dc_com)=; cacherefresh (so_vdsconnector)=; from_generic_to_cacheref...}
CF_O_SID                    : @{group (so_dc_asurion_dc_org_custom)=; cacherefresh (so_vdsconnector)=; user (so_dc_asurion_dc_org...group
                            (so_dc_newcorp_dc_com_custom)=; user (so_dc_newcorp_dc_com_custom)=; user (so_dc_int_dc_asurion_dc_co...java=;
                            from_group1_to_cacherefresh.java=; from_group2_to_cacherefresh.java=; from_user2_to_cacherefresh.java=;...}
CF_OU_DN_O_VIEW             : @{group (so_dc_asurion_dc_org_custom)=; cacherefresh (so_vdsconnector)=; user (so_dc_asurion_dc_org_c...group
                            (so_dc_newcorp_dc_com_custom)=; user (so_dc_newcorp_dc_com_custom)=; user (so_dc_int_dc_asurion_dc_com...java=;
                            from_group1_to_cacherefresh.java=; from_group2_to_cacherefresh.java=; from_user2_to_cacherefresh.java=;...}

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
