# Get-GoodNight

## SYNOPSIS
Says 'Good night' from XML help.
## SYNTAX
### Parameter Set 1
```
Get-GoodNight [-Name] <String> [[-ID] <Int32>]
```


## DESCRIPTION
Says 'Good night' from XML help.

## EXAMPLES
### -------------------------- EXAMPLE 1 --------------------------
```
PS C:\\>Get-GoodNight -Name Joe
```
This command says 'good night' to Joe. The Name parameter is mandatory and positional.
### -------------------------- EXAMPLE 2 --------------------------
```
PS C:\\>Get-GoodNight VBScript
```
This command says 'good night' to VBScript. We should have done this a long time ago.

## PARAMETERS

### Name
Specifies the name that the cmdlet greets.

```yaml
Type: String
Parameter Sets: Parameter Set 1
Aliases: 

Required: true
Position: 0
Default Value: 
Pipeline Input: false
```

### ID


```yaml
Type: Int32
Parameter Sets: Parameter Set 1
Aliases: 

Required: false
Position: 1
Default Value: 0
Pipeline Input: false
```

## INPUTS

## OUTPUTS

## NOTES

Additional information about the function.

## RELATED LINKS
