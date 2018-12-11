---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSUser

## SYNOPSIS
Returns user object from the ou=users,o=asurion location.

## SYNTAX

```
Get-VDSUser [-UserName] <String> [[-Domain] <String>] [[-Server] <String>] [[-GetMemberOf] <Boolean>]
 [-Cred] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
This script will call the VDS admin api and preform a LDAP lookup for a user
matching the name passed in $UserName and $Domain parameters.
e.
g.
cn=$Domain_$UserName,ou=users,o=asurion

## EXAMPLES

### EXAMPLE 1
```
Get-VDSUser -UserName Anthony.Brown -Domain HQDOMAIN -Server WPRNEDIFVDS003V -Cred $vdscred
```

whenCreated          : 20111123110016.0Z
objectCategory       : CN=Person,CN=Schema,CN=Configuration,DC=asurion,DC=com
adObjectGUID         : fe8a55e0-7cc1-4e2e-b0a6-a5811a2da47d
employeeID           : 160068
objectGUID           : {base64binary}4FWK/sF8Lk6wpqWBGi2kfQ==
extensionAttribute15 : 169158
mail                 : Anthony.Brown@asurion.com
extensionAttribute14 : US
memberOf             : {cn=ASURION_ARS_ServiceDesk_Access,ou=groups,o=asurion, ...}
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

### -GetMemberOf
This is a flag that determines if the user's groups should be returned.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
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
Position: 5
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
