---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Get-VDSObject

## SYNOPSIS
Returns the VDS object specified by DN.

## SYNTAX

```
Get-VDSObject [-DN] <String> [[-Server] <String>] [-Cred] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
This script will call the VDS admin api and preform a LDAP lookup for the object specified by the DN parameter.

## EXAMPLES

### EXAMPLE 1
```
Get-VDSObject -DN 'CN=Anthony Brown,OU=StandardSecurity,OU=Users,OU=Nashville,OU=NorthAmerica,OU=AsurionRoot,DC=int,DC=asurion,DC=com'
```

userName                     : HQDOMAIN\Anthony.Brown
userPrincipalName            : Anthony.Brown@int.asurion.com
description                  : 03/20/2018 12:43:23
adObjectSID                  : S-1-5-21-3751615294-507207739-1261199621-5325684
showInAddressBook            : {CN=Default Global Address List,CN=All Global Address Lists,...}
mailNickname                 : Anthony.Brown
homeDirectory                : \\\\nedsancif02.inf.asurion.net\user_dir_new\Anthony.Brown
homeDrive                    : H:
uSNChanged                   : 5591014545
...

## PARAMETERS

### -DN
This is the full distinguisedName for the object to return.

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

### -Server
This is the name of the VDS server to connect to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
Position: 3
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
