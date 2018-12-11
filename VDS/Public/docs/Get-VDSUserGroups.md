---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSUserGroups

## SYNOPSIS
Returns users group membership from the ou=users,o=asurion.

## SYNTAX

```
Get-VDSUserGroups [-UserName] <String> [[-Domain] <String>] [[-Server] <String>] [-Cred] <PSCredential>
 [<CommonParameters>]
```

## DESCRIPTION
This script will call the VDS admin api and preform a LDAP lookup for a user
matching the name passed in $UserName and $Domain parameters and return only the user's groups.
e.
g.
cn=$Domain_$UserName,ou=users,o=asurion

## EXAMPLES

### EXAMPLE 1
```
Get-VDSUserGroups -UserName Anthony.Brown -Domain HQDOMAIN -Server WPRNEDIFVDS003V -Cred $vdscred
```

cn=ASURION_ARS_ServiceDesk_Access,ou=groups,o=asurion
cn=HQDOMAIN_CA_ITCM_Users_Desktops,ou=groups,o=asurion
cn=HQDOMAIN_CA_ITCM_Users_Servers,ou=groups,o=asurion
cn=HQDOMAIN_ITALLClarity_Users,ou=groups,o=asurion
cn=HQDOMAIN_Zoom_Pro_Users,ou=groups,o=asurion
cn=HQDOMAIN_PatchCmdCenter_Full_Admins,ou=groups,o=asurion
cn=HQDOMAIN_APP-PR-IF-VEN-Certificates_NA_Prod_Infrastructure_AsurionSSO,ou=groups,o=asurion
cn=HQDOMAIN_Clarity_Users,ou=groups,o=asurion
cn=HQDOMAIN_FiremonAdministrators,ou=groups,o=asurion
...

## PARAMETERS

### -UserName
This is the name of the user to query VDS for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
This is the domain to search for the user in.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: HQDOMAIN
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
This is the name of the VDS server to connect to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (Get-VDSActiveLeaderNode)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Cred
This is a PSCredential object with the username specified in UPN format.
e.g.
!anthony.brown@int.asurion.com

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
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
