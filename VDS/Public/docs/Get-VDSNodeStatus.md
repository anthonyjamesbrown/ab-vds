---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSNodeStatus

## SYNOPSIS
Get On/off status for each VDS service running on each cluster node.

## SYNTAX

```
Get-VDSNodeStatus [[-Server] <String>] [[-NodeId] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns the ON/OFF status for each service running on each cluster node.

The following data is returned:
    glassfish_status : Status of the GlassFish application server on the node.
A value of ON means GlassFish is running on the node.
A value of OFF 
                        indicates GlassFish is not running on the node.
    http_status      : Status of the VDS HTTP port.
A value of ON means VDS is listening on the HTTP port.
A value of OFF indicates 
                        VDS is not listening on the HTTP port.
    https_status     : Status of the VDS HTTPS port.
A value of ON means VDS is listening on the HTTPS (for SSL/TLS) port.
A value of OFF indicates 
                        VDS is not listening on the HTTPS (for SSL/TLS) port.
    ldap_status      : Status of the VDS LDAP port.
A value of ON means VDS is listening on the LDAP port.
A value of OFF indicates RadiantOne FID is
                        not listening on the LDAP port.
    ldap_ssl_status  : Status of the VDS LDAPS port.
A value of ON means VDS is listening on the LDAPS (for SSL/TLS) port.
A value of OFF indicates
                        VDS is not listening on the LDAPS (for SSL/TLS) port.
    mq_status        : Status of the JMS message queue in the cluster.
A value of ON means OpenMQ (JMS) is running and accessible by VDS.
It could be 
                        running on any cluster node.
A value of OFF indicates OpenMQ (JMS) is not running and inaccessible by VDS.
    vrs_ssl_status   : Status of the VDS JDBC SSL port.
A value of ON means VDS is listening on the JDBC SSL port.
A value of OFF indicates VDS is not 
                        listening on the JDBC SSL port.
    vrs_status       : Status of the VDS JDBC port.
A value of ON means VDS is listening on the JDBC port.
A value of OFF indicates RadiantOne FID is 
                        not listening on the JDBC port.
    zk_status        : Status of the ZooKeeper on the node.
A value of ON means ZooKeeper is running on the node.
A value of OFF indicates ZooKeeper is 
                        not running on the node.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSNodeStatus
```

ldap_status      : ON
vrs_status       : OFF
ldap_ssl_status  : ON
zk_status        : ON
mq_status        : ON
http_status      : ON
vrs_ssl_status   : OFF
glassFish_status : OFF
https_status     : ON
Name             : wprsedifvds002v.asurion.org
CloudId          : 914d3436-0f5f-4239-a76d-bcaaab111c95

ldap_status      : ON
vrs_status       : OFF
ldap_ssl_status  : ON
zk_status        : ON
mq_status        : ON
http_status      : ON
vrs_ssl_status   : OFF
glassFish_status : ON
https_status     : ON
Name             : wprsedifvds003v.asurion.org
CloudId          : aaeccabc-7af2-4fcf-b2db-020690112f5c

ldap_status      : ON
vrs_status       : OFF
ldap_ssl_status  : ON
zk_status        : ON
mq_status        : ON
http_status      : ON
vrs_ssl_status   : OFF
glassFish_status : OFF
https_status     : ON
Name             : wprsedifvds001v.asurion.org
CloudId          : a80969d3-0f8c-4e0f-9a09-0579e92023f1

### EXAMPLE 2
```
Get-VDSNodeStatus -NodeId a80969d3-0f8c-4e0f-9a09-0579e92023f1
```

ldap_status      : ON
vrs_status       : OFF
ldap_ssl_status  : ON
zk_status        : ON
mq_status        : ON
http_status      : ON
vrs_ssl_status   : OFF
glassFish_status : OFF
https_status     : ON
Name             : wprsedifvds001v.asurion.org
CloudId          : a80969d3-0f8c-4e0f-9a09-0579e92023f1

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
