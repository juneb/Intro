# New-AppLockerPolicy

## SYNOPSIS
Creates a new AppLocker policy from a list of file information and other rule creation options.

## SYNTAX

### Parameter Set 1
```
New-AppLockerPolicy [-FileInformation] <List<FileInformation>> [-IgnoreMissingFileInformation <Object>] [-InformationAction <Object>] [-InformationVariable <String>] [-Optimize <Object>] [-RuleNamePrefix <String>] [-RuleType <List<RuleType>>] [-ServiceEnforcement <String>] [-User <String>] [-Xml <Object>]
```

## DESCRIPTION
The New-AppLockerPolicy cmdlet uses a list of file information to automatically generate a list of rules for a given user or group. Rules can be generated based on publisher, hash, or path information.

Run the Get-AppLockerFileInformation cmdlet to create the list of file information.

By default, the output is an AppLockerPolicy object. If the Xml parameter is specified, the output will be the AppLocker policy as an XML-formatted string.

## EXAMPLES

### EXAMPLE 1

```powershell
C:\PS>Get-ChildItem C:\Windows\System32\*.exe | Get-AppLockerFileInformation | New-AppLockerPolicy -RuleType Publisher, Hash -User Everyone -RuleNamePrefix System32
                                Version RuleCollections                         RuleCollectionTypes 
                                ------- ---------------                         ------------------- 
                                      1 {Microsoft.Security.ApplicationId.Po... {Exe}
```

This example creates an AppLocker policy that contains allow rules for all of the executable files in C:\\Windows\\System32. The policy contains publisher rules for those files with publisher information and hash rules for those that do not. The rules are prefixed with System32: and the rules apply to the Everyone group.



### EXAMPLE 2

```powershell
C:\PS>Get-ChildItem C:\Windows\System32\*.exe | Get-AppLockerFileInformation | New-AppLockerPolicy -RuleType Path -User Everyone -Optimize -XML
<AppLockerPolicy Version="1"><RuleCollection Type="Exe" EnforcementMode="NotConfigured"><FilePathRule Id="31B2F340-016D 
-11D2-945F-00C04FB984F9" Name="%SYSTEM32%\*" Description="" 10 UserOrGroupSid="S-1-5-21-3165297888-301567370-576410423- 
13" Action="cAllow"><Conditions><FilePathCondition Path="%SYSTEM32%\*" /></Conditions></FilePathRule></RuleCollection> 
</AppLockerPolicy>
```

This example creates an XML-formatted AppLocker policy for all of the executable files in C:\\Windows\\System32. The policy contains only path rules, the rules are applied to the Everyone group, and the Optimize parameter indicates that similar rules are grouped together where possible.



### EXAMPLE 3

```powershell
C:\PS>Get-AppLockerFileInformation -EventLog -LogPath "Microsoft-Windows-AppLocker/EXE and DLL" -EventType Audited | New-AppLockerPolicy -RuleType Publisher,Hash -User domain\FinanceGroup -IgnoreMissingFileInformation | Set-AppLockerPolicy -LDAP "LDAP://DC13.TailspinToys.com/CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=WingTipToys,DC=com"
```

This example creates a new AppLocker policy from the audited events in the local Microsoft-Windows-AppLocker/EXE and DLL event log. All of the rules will be applied to the domain\\FinanceGroup group. Publisher rules are created when the publisher information is available, and hash rules are created if the publisher information is not available. If only path information is available for a file, then the file is skipped because the IgnoreMissingFileInformation parameter is specified, and the file is included in the warning log. If the IgnoreMissingFileInformation parameter is not specified when file information is missing, then the cmdlet exits because it cannot create the specified rule type. After the new AppLocker policy is created, the AppLocker policy of the specified Group Policy Object (GPO) is set. The existing AppLocker policy in the specified GPO will be overwritten.



## PARAMETERS

### FileInformation
Specifies a file that can contain publisher, path, and hash information. Some information may be missing, such as publisher information for an unsigned file.

```yaml
Type: List<FileInformation>
Parameter Sets: Parameter Set 1
Aliases: none

Required: true
Position: 1
Default Value: none
Pipeline Input: true (ByValue, ByPropertyName)
```

### IgnoreMissingFileInformation
Specifies that, if a rule cannot be created for a file because of missing file information, then evaluation of the remaining file information will continue and a warning log of the files skipped will be generated.

```yaml
Type: SwitchParameter
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### InformationAction
Specifies how this cmdlet responds to an information event. The acceptable values for this parameter are:

-- SilentlyContinue
-- Stop
-- Continue
-- Inquire
-- Ignore
-- Suspend

```yaml
Type: System.Management.Automation.ActionPreference
Parameter Sets: Parameter Set 1
Aliases: infa

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### InformationVariable
Specifies a variable in which to store an information event message.

```yaml
Type: System.String
Parameter Sets: Parameter Set 1
Aliases: iv

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### Optimize
Specifies that similar rules will be grouped together.

```yaml
Type: SwitchParameter
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### RuleNamePrefix
Specifies a name to add as the prefix for each rule that is created.

```yaml
Type: String
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### RuleType
Specifies the type of rules to create from the file information. Publisher, path, or hash rules can be created from the file information. Multiple rule types may be specified. Therefore, that there are backup rule types if the necessary file information is not available. 

For example, if Publisher, Hash is specified for this parameter, then the hash rules are applied when publisher information is not available.

```yaml
Type: List<RuleType>
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### ServiceEnforcement
Specifies whether the AppLocker policy for EXE and DLL rule collections applies to non-interactive processes. The acceptable values for this parameter are:

-- NotConfigured
-- Enabled
-- ServicesOnly

```yaml
Type: System.String
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### User
Specifies the user or group to which the rules are applied. The acceptable values for this parameter are:

 -- DNS user name (domain\\username) 
 -- User Principal Name (username@domain.com) 
 -- SAM user name (username) 
 -- Security identifier (S-1-5-21-3165297888-301567370-576410423-1103)

```yaml
Type: String
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### Xml
Specifies that the output of the AppLocker policy be as an XML-formatted string.

```yaml
Type: SwitchParameter
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

## INPUTS

### Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.FileInformation


## OUTPUTS

### Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.AppLockerPolicy
AppLockerPolicy

### System.String


## NOTES

## RELATED LINKS

[Online Version:](http://go.microsoft.com/fwlink/?linkid=287250)
[Get-AppLockerFileInformation]()
[Get-AppLockerPolicy]()
[Set-AppLockerPolicy]()
[Test-AppLockerPolicy]()

*Generated by: PowerShell HelpWriter 2017 v2.1.33*
