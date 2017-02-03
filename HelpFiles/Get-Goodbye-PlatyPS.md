---
external help file: Test-Markdown.psm1-Help.xml
online version: http://info.sapien.com
schema: 2.0.0
---

# Get-Goodbye

## SYNOPSIS
Says 'Goodbye' from comment-based help.

## SYNTAX

### UNNAMED_PARAMETER_SET_1
```
Get-Goodbye -Name <String>
```

### UNNAMED_PARAMETER_SET_2
```
Get-Goodbye -ID <Int32> [-Quiet]
```

## DESCRIPTION
Says 'Goodbye' from comment-based help.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-Goodbye -Name Joe
```

This command says goodbye to Joe.

You can use a command like this with any name.

### -------------------------- EXAMPLE 2 --------------------------
```
Get-Goodbye VBScript
```

This command shows that the Name parameter is positional, so you can omit it.

It's time to say 'goodbye' to VB Script anyway.

Really, enough is enough.

## PARAMETERS

### -Name
Says hello to this name.
Enter only one name.

Yes, that name is fine.

```yaml
Type: String
Parameter Sets: UNNAMED_PARAMETER_SET_1
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ID
Enter the ID of the person you want to greet.

Everyone has an ID.

Or, they can't vote.

```yaml
Type: Int32
Parameter Sets: UNNAMED_PARAMETER_SET_2
Aliases: PathID

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quiet
Returns only the greeting.
By default, Get-Goodbye returns a custom object.

```yaml
Type: Switch
Parameter Sets: UNNAMED_PARAMETER_SET_2
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String

## OUTPUTS

### PSCustomObject

## NOTES
===========================================================================
         Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2015 v4.2.99
	 Created on:   	12/21/2015 10:38 AM
	 Created by:   	 June Blender
	 Organization: 	SAPIEN Technologies, Inc
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.

## RELATED LINKS

[Get-Hello]()

