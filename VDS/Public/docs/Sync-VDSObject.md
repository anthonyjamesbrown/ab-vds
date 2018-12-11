---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Sync-VDSObject

## SYNOPSIS
Syncs the VDS object specified by DN. 
This action should not be prefromed on o=asurion objects.

## SYNTAX

```
Sync-VDSObject [-DN] <String> [[-Server] <String>] [-Cred] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
This script will call the VDS admin api and preform a Sync operation for the object specified by the DN parameter.

## EXAMPLES

### EXAMPLE 1
```
Sync-VDSObject -DN 'CN=Anthony Brown,OU=StandardSecurity,OU=Users,OU=Nashville,OU=NorthAmerica,OU=AsurionRoot,DC=int,DC=asurion,DC=com'
```

Invoked Sync for CN=Anthony Brown,OU=StandardSecurity,OU=Users,OU=Nashville,OU=NorthAmerica,OU=AsurionRoot,DC=int,DC=asurion,DC=com

## PARAMETERS

### -DN
This is the full distinguisedName for the object to sync.

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
