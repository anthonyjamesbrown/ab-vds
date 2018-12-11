---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSConnectionsInfo

## SYNOPSIS
Get information about the current connections for a given VDS node.

## SYNTAX

```
Get-VDSConnectionsInfo [[-Server] <String>] [<CommonParameters>]
```

## DESCRIPTION
This script returns information about the current connections for a given VDS node.

If you -Server parameter is used then this request will run against the Active Leader node in the active datacenter. 
This command is 
one where you may want to use specific servers.

The following data is returned:
connBindDn      : Bind DN associated with the client connection.
connClientIp    : Client IP address that established the connection.
connClientPort  : Port number the client established the connection from.
connId          : Unique identifier associated with the client connection.
connServerIp    : IP address of the VDS node the client is connected to.
connServerPort  : Port that the client connection is accessing VDS on.
opCount         : The total number of operations the VDS node has processed for the connection.
opCountAbandon  : Number of abandon operations performed on this connection.
opCountAdd      : Number of add operations performed on this connection.
opCountBind     : Number of bind operations performed on this connection.
opCountCompare  : Number of compare operations performed on this connection.
opCountDelete   : Number of delete operations performed on this connection.
opCountModify   : Number of modify operations performed on this connection.
opCountModifyDN : Number of modifyDN operations performed on this connection.
opCoundSearch   : Number of searches performed on this connection.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSConnectionsInfo -Server wprsedifvds002v.asurion.org
```

Name            : wprsedifvds002v.asurion.org
CloudId         : 914d3436-0f5f-4239-a76d-bcaaab111c95
Id              : 236840
opCountSearch   : 6769
opCountAdd      : 0
opCountAbandon  : 0
connClientIp    : 10.5.94.10
connClientPort  : 51865
opCountBind     : 1
opCountModify   : 0
connBindDn      : CN=svc.us-p-sso-ldap,OU=SSO,OU=NA-Nashville,OU=service,OU=accounts,DC=int,DC=asurion,DC=com
opCountModifyDn : 0
opCountCompare  : 0
connServerIp    : 10.5.94.179
connId          : 236840
opCount         : 6770
opCountDelete   : 0
connServerPort  : 636

Name            : wprsedifvds002v.asurion.org
CloudId         : 914d3436-0f5f-4239-a76d-bcaaab111c95
Id              : 139866
opCountSearch   : 10749
opCountAdd      : 0
opCountAbandon  : 0
connClientIp    : 10.5.94.10
connClientPort  : 50449
opCountBind     : 1
opCountModify   : 0
connBindDn      : CN=svc.us-p-sso-ldap,OU=SSO,OU=NA-Nashville,OU=service,OU=accounts,DC=int,DC=asurion,DC=com
opCountModifyDn : 0
opCountCompare  : 0
connServerIp    : 10.5.94.179
connId          : 139866
opCount         : 10750
opCountDelete   : 0
connServerPort  : 636
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
