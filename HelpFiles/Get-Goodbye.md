# Get-Goodbye

## SYNOPSIS
Says 'Goodbye' from comment-based help.
## SYNTAX
### NameSet
```
Get-Goodbye -Name <String>
```

### IDSet
```
Get-Goodbye -ID <Int32> [-Quiet]
```


## DESCRIPTION
Says 'Goodbye' from comment-based help.

## EXAMPLES
### -------------------------- EXAMPLE 1 --------------------------
```
PS C:\\>Get-Goodbye -Name Joe
```
This command says goodbye to Joe.

You can use a command like this with any name.
### -------------------------- EXAMPLE 2 --------------------------
```
PS C:\\>Get-Goodbye VBScript
```
This command shows that the Name parameter is positional, so you can omit it.

It's time to say 'goodbye' to VB Script anyway.

Really, enough is enough.

## PARAMETERS

### Name


```yaml
Type: String
Parameter Sets: NameSet
Aliases: 

Required: true
Position: named
Default Value: 
Pipeline Input: false
```

### ID


```yaml
Type: Int32
Parameter Sets: , IDSet
Aliases: PathID

Required: true
Position: named
Default Value: 0
Pipeline Input: false
```

### Quiet
Returns only the greeting. By default, Get-Goodbye returns a custom object.

```yaml
Type: Switch
Parameter Sets: , IDSet
Aliases: 

Required: false
Position: named
Default Value: False
Pipeline Input: false
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
[Online Version:]\(http://info.sapien.com)
[Get-Hello]\()
