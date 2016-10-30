external help file: ManageProfiles-help.xml  
online version: 
schema: 2.0.0  

# CanRename

## SYNOPSIS
Does the current user have permission to rename the specified profile file?

## SYNTAX

```
CanRename [-File] <FileInfo>
```

## DESCRIPTION
This helper function returns a Boolean value that indicates whether the current user has permission
to rename the specified profile file. 

This function returns False when the file is in the System32 directory and
the current session is not elevated.
Otherwise, it returns True.

In the ManageProfiles module, the Enable-Profile and Disable-Profile functions
call this function before trying to add or remove '.disabled' from the profile
file name.

## EXAMPLES

### Example 1
```
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -File
Specifies the file that you want to rename.
Enter a FileInfo object, such
as one returned by Get-Item and Get-ChildItem.

```yaml
Type: FileInfo
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### System.Boolean

## NOTES
ManageProfiles does not export this function.

## RELATED LINKS

