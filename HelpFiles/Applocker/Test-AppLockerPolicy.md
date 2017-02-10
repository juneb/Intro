# Test-AppLockerPolicy

## SYNOPSIS
Specifies the AppLocker policy to determine whether the input files will be allowed to run for a given user.

## SYNTAX

### Parameter Set 1
```
Test-AppLockerPolicy [-XmlPolicy] <String> [-Filter <List<PolicyDecision>>] [-InformationAction <Object>] [-InformationVariable <String>] [-User <String>] -Path <List<String>>
```

### Parameter Set 2
```
Test-AppLockerPolicy [-XmlPolicy] <String> [-Filter <List<PolicyDecision>>] [-InformationAction <Object>] [-InformationVariable <String>] [-User <String>] -Packages <List<AppxPackage>>
```

### Parameter Set 3
```
Test-AppLockerPolicy [-PolicyObject] <AppLockerPolicy> [-Filter <List<PolicyDecision>>] [-InformationAction <Object>] [-InformationVariable <String>] [-User <String>] -Path <List<String>>
```

## DESCRIPTION
The Test-AppLockerPolicy cmdlet specifies the AppLocker policy to determine whether a list of files is allowed to run on the local computer for a specified user.

To test AppLocker rules for a nested group, a representative member of the nested group should be specified for the User parameter. For example, a rule that allows the Everyone group to run calc.exe may not appear to apply correctly when the nested Finance group for the User parameter is specified. Instead, a representative member of the Finance group should be specified for the User parameter.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\>Test-AppLockerPolicy -XMLPath C:\Policy.xml -Path c:\windows\system32\calc.exe, C:\windows\system32\notepad.exe -User Everyone
```

This example reports if calc.exe and notepad.exe will be allowed to run for Everyone under the policy specified by C:\\Policy.xml.



### EXAMPLE 2

```powershell
PS C:\>Get-ChildItem C:\windows\system32\*.exe | Test-AppLockerPolicy c:\Policy.xml -Filter DeniedByDefault
```

This example lists the executables under C:\\Windows\\System32 that everyone will be denied by the policy specified by C:\\Policy.xml because there is no explicit rule for the file.



### EXAMPLE 3

```powershell
PS C:\>Get-AppLockerPolicy -Local | Test-AppLockerPolicy -Path C:\Windows\System32\*.exe -User contoso\saradavis -Filter Denied | Format-List -Property | Set-Content (ꞌC:\temp\DeniedFiles.txtꞌ)
```

This example gets the local AppLocker policy, uses the policy to determine which executables in C:\\Windows\\System32 that contoso\\saradavis is explicitly denied access to run, and then redirects the list to a text file.



### EXAMPLE 4

```powershell
PS C:\>Get-AppxPackage –AllUsers | Test-AppLockerPolicy –XmlPolicy .\SamplePolicy.xml
```

This example lists all the packages installed on this computer, for all the users, and tests them against a saved policy.



## PARAMETERS

### Filter
Specifies the policy decision by which to filter the output for each input file. The acceptable values for this parameter are: Allowed, Denied, DeniedByDefault, or AllowedByDefault.

```yaml
Type: List<PolicyDecision>
Parameter Sets: (All)
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
Parameter Sets: (All)
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
Parameter Sets: (All)
Aliases: iv

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### Packages
Specifies a list of installed packaged applications, from which the file information is retrieved.

```yaml
Type: List<AppxPackage>
Parameter Sets: Parameter Set 2
Aliases: none

Required: true
Position: named
Default Value: none
Pipeline Input: true (ByValue, ByPropertyName)
```

### Path
Specifies the list of the file paths to test. Regular expressions are supported.

```yaml
Type: List<String>
Parameter Sets: Parameter Set 1, Parameter Set 3
Aliases: none

Required: true
Position: named
Default Value: none
Pipeline Input: true (ByValue, ByPropertyName)
```

### PolicyObject
Specifies the Applocker policy. Can be obtained from the Get-AppLockerPolicy or the New-AppLockerPolicy cmdlet.

```yaml
Type: AppLockerPolicy
Parameter Sets: Parameter Set 3
Aliases: none

Required: true
Position: 1
Default Value: none
Pipeline Input: true (ByValue, ByPropertyName)
```

### User
Defines the user or group to be used for testing the rules in a specified AppLocker policy. The acceptable values for this parameter are:

-- DNS user name (domain\\username) 
-- User Principal Name (username@domain.com) 
-- SAM user name (username) 
-- Security identifier (S-1-5-21-3165297888-301567370-576410423-1103)

```yaml
Type: String
Parameter Sets: (All)
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### XmlPolicy
Specifies the file path and name of the XML-formatted file that contains the AppLocker policy.

```yaml
Type: String
Parameter Sets: Parameter Set 1, Parameter Set 2
Aliases: none

Required: true
Position: 1
Default Value: none
Pipeline Input: false
```

## INPUTS

### Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.AppLockerPolicy
AppLockerPolicy

## OUTPUTS

### Microsoft.Security.ApplicationId.PolicyManagement.AppLockerPolicyDecision


## NOTES

## RELATED LINKS

[Online Version:](http://go.microsoft.com/fwlink/?linkid=287252)
[Get-AppLockerFileInformation]()
[Get-AppLockerPolicy]()
[New-AppLockerPolicy]()
[Set-AppLockerPolicy]()
[Get-AppxPackage]()

*Generated by: PowerShell HelpWriter 2017 v2.1.33*
