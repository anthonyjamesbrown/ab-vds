---
external help file: AB-VDS-help.xml
Module Name: AB-VDS
online version:
schema: 2.0.0
---

# Test-VDSUser

## SYNOPSIS
Performs a series of membership queries for the specified user and group. 
This function is for testing user sync issues in VDS.

## SYNTAX

```
Test-VDSUser [-UserName] <String> [-GroupName] <String> [[-Domain] <String>] [[-Server] <String>]
 [-Cred] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
This script will call the VDS admin api and preform a series of group membership queries for the specified user and group.

The checks include:
    - User exists in AD
    - Group exists in AD
    - User is a member of the group in AD
    - User in the domain namespace in VDS is a member of the group in the domain namespace
    - Group in the domain namespace contains the domain namespace user as a member
    - User in the o=asurion view is a member of the group in the same view
    - Group in the o=asurion view contains the user in the same view as a member

These tests will help identify if the user in question is not being synced at any layer in the process.

## EXAMPLES

### EXAMPLE 1
```
Sync-VDSObject -DN 'CN=Anthony Brown,OU=StandardSecurity,OU=Users,OU=Nashville,OU=NorthAmerica,OU=AsurionRoot,DC=int,DC=asurion,DC=com'
```

Invoked Sync for CN=Anthony Brown,OU=StandardSecurity,OU=Users,OU=Nashville,OU=NorthAmerica,OU=AsurionRoot,DC=int,DC=asurion,DC=com

## PARAMETERS

### -UserName
{{Fill UserName Description}}

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

### -GroupName
{{Fill GroupName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
{{Fill Domain Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
Position: 4
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
