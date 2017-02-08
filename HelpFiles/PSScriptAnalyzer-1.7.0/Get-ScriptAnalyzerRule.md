﻿# Get-ScriptAnalyzerRule

## SYNOPSIS
Gets the script analyzer rules on the local computer.

## SYNTAX

### Set 1
```
Get-ScriptAnalyzerRule [[-Name] <String[]>] [-CustomRulePath <String[]>] [-RecurseCustomRulePath] [-Severity <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Gets the script analyzer rules on the local computer. You can select rules by Name, Severity, Source, or SourceType, or even particular words in the rule description.

Use this cmdlet to create collections of rules to include and exclude when running the Invoke-ScriptAnalyzer cmdlet.

To get information about the rules, see the value of the Description property of each rule.

The PSScriptAnalyzer module tests the Windows PowerShell code in a script, module, or DSC resource to determine whether, and to what extent, it fulfils best practice standards. For more information about PSScriptAnalyzer, type: Get-Help about_PSScriptAnalyzer.

PSScriptAnalyzer is an open-source project. To contribute or file an issue, see GitHub.com\\PowerShell\\PSScriptAnalyzer.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------

```powershell
Get-ScriptAnalyzerRule
```

This command gets all Script Analyzer rules on the local computer.

### -------------------------- EXAMPLE 2 --------------------------

```powershell
Get-ScriptAnalyzerRule -Severity Error
```

This command gets only rules with the Error severity.

### -------------------------- EXAMPLE 3 --------------------------

```powershell
$DSCError = Get-ScriptAnalyzerRule -Severity Error | Where SourceName -eq PSDSC

PS C:\>$Path = "$home\Documents\WindowsPowerShell\Modules\MyDSCModule\*"

PS C:\> Invoke-ScriptAnalyzerRule -Path $Path -IncludeRule $DSCError -Recurse
```

This example runs only the DSC rules with the Error severity on the files in the MyDSCModule module.

Using the IncludeRule parameter of Invoke-ScriptAnalyzerRule is much more efficient than using its Severity parameter, which is applied only after using all rules to analyze all module files.

### -------------------------- EXAMPLE 4 --------------------------

```powershell
$TestParameters = Get-ScriptAnalyzerRule -Severity Error, Warning -Name *Parameter*, *Alias*
```

This command gets rules with "Parameter" or "Alias" in the name that generate an Error or Warning. Use this set of rules to test the parameters of your script or module.

### -------------------------- EXAMPLE 5 --------------------------

```powershell
Get-ScriptAnalyzerRule -CustomRulePath $home\Documents\WindowsPowerShell\Modules\*StrictRules -RecurseCustomRulePath
```

This command gets the standard rules and the rules in the VeryStrictRules and ExtremelyStrictRules modules. The command uses the RecurseCustomRulePath parameter to get rules defined in subdirectories of the matching paths.

## PARAMETERS

### CustomRulePath
Gets the Script Analyzer rules in the specified path in addition to the standard Script Analyzer rules. By default, PSScriptAnalyzer gets only the standard rules specified in the Microsoft.Windows.PowerShell.ScriptAnalyzer.BuiltinRules.dll file in the module.

Enter the path to a .NET assembly or module that contains Script Analyzer rules. You can enter only one value, but wildcards are supported. To get rules in subdirectories of the path, use the RecurseCustomRulePath parameter.

You can create custom rules by using a custom .NET assembly or a Windows PowerShell module, such as the Community Analyzer Rules in https://github.com/PowerShell/PSScriptAnalyzer/blob/development/Tests/Engine/CommunityAnalyzerRules/CommunityAnalyzerRules.psm1.

```yaml
Type: String[]
Parameter Sets: Set 1
Aliases: CustomizedRulePath

Required: false
Position: named
Default Value: The rules in Microsoft.Windows.PowerShell.ScriptAnalyzer.BuiltinRules.dll.
Pipeline Input: false
```

### RecurseCustomRulePath
Searches the CustomRulePath location recursively to add rules defined in files in subdirectories of the path. By default, Get-ScriptAnalyzerRule adds only the custom rules in the specified path.

```yaml
Type: SwitchParameter
Parameter Sets: Set 1
Aliases: 

Required: false
Position: named
Default Value: False
Pipeline Input: false
```

### Name
Gets only rules with the specified names or name patterns. Wildcards are supported. If you list multiple names or patterns, it gets rules that match any of the name patterns, as though the name patterns were joined by an OR.

By default, Get-ScriptAnalyzerRule gets all rules.

```yaml
Type: String[]
Parameter Sets: Set 1
Aliases: 

Required: false
Position: 1
Default Value: All rules
Pipeline Input: false
```

### Severity
Gets only rules with the specified severity values. Valid values are Information, Warning, and Error. By default, Get-ScriptAnalyzerRule gets all rules.

```yaml
Type: String[]
Parameter Sets: Set 1
Aliases: 

Required: false
Position: named
Default Value: All rules
Pipeline Input: false
```

### \<CommonParameters\>
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
You cannot pipe input to this cmdlet.

## OUTPUTS

### Microsoft.Windows.PowerShell.ScriptAnalyzer.Generic.RuleInfo
The RuleInfo object is a custom object created especially for Script Analyzer. It is not documented on MSDN.

## NOTES



## RELATED LINKS

[Online Version:](http://go.microsoft.com/fwlink/?LinkId=525913)
[Invoke-ScriptAnalyzer]()
[about_PSScriptAnalyzer]()
[PSScriptAnalyzer on GitHub](https://github.com/PowerShell/PSScriptAnalyzer)

*Generated by: PowerShell HelpWriter 2017 v2.1.33*
