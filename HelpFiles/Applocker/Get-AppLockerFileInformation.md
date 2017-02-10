# Get-AppLockerFileInformation

## SYNOPSIS
Gets the file information necessary to create AppLocker rules from a list of files or an event log.

## SYNTAX

### Parameter Set 1
```
Get-AppLockerFileInformation [[-Path] <List<String>>] [-InformationAction <Object>] [-InformationVariable <String>]
```

### Parameter Set 2
```
Get-AppLockerFileInformation [-FileType <Object>] [-InformationAction <Object>] [-InformationVariable <String>] [-Recurse <Object>] -Directory <String>
```

### Parameter Set 3
```
Get-AppLockerFileInformation [-EventType <List<AppLockerEventType>>] [-InformationAction <Object>] [-InformationVariable <String>] [-LogPath <String>] [-Statistics <Object>] -EventLog <Object>
```

### Parameter Set 4
```
Get-AppLockerFileInformation [[-Packages] <List<AppxPackage>>] [-InformationAction <Object>] [-InformationVariable <String>]
```

## DESCRIPTION
The Get-AppLockerFileInformation cmdlet gets the AppLocker file information from a list of files or an event log. File information includes the publisher information, file hash, and file path.

The file information from an event log may not contain all of the publisher information, file hash, and file path fields. Files that are not signed will not have any publisher information.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\>Get-AppLockerFileInformation -Directory C:\Windows\system32\ -Recurse -FileType exe, script
```

This example gets the file information for all the .exe files and scripts under %windir%\\system32.



### EXAMPLE 2

```powershell

PS C:\>Get-AppLockerFileInformation -Path "C:\Program Files (x86)\Internet Explorer\iexplore.exe" | Format-List
Path      : %PROGRAMFILES%\INTERNET EXPLORER\IEXPLORE.EXE 
Publisher : CN=WINDOWS MAIN BUILD LAB ACCOUNT\WINDOWS® INTERNET EXPLORER\IEXPLORE.EXE,10.0.8421.0 
Hash      : SHA256 0x5F374C2DD91A6F9E9E96F149EE221EC0454649F50E1AF6D3DAEFB849FB7C551C 
AppX      : False 


PS C:\>Get-AppLockerFileInformation -Path "C:\Program Files\Internet Explorer\iexplore.exe" | Format-List
Path      : %PROGRAMFILES%\INTERNET EXPLORER\IEXPLORE.EXE 
Publisher : CN=WINDOWS MAIN BUILD LAB ACCOUNT\WINDOWS® INTERNET EXPLORER\IEXPLORE.EXE,10.0.8421.0 
Hash      : SHA256 0x5F374C2DD91A6F9E9E96F149EE221EC0454649F50E1AF6D3DAEFB849FB7C551C 
AppX      : False
```

This example gets the file information for the file specified by the path.



### EXAMPLE 3

```powershell
PS C:\>Get-AppXPackage –AllUsers | Get-AppLockerFileInformation
Path      : windows.immersivecontrolpanel_6.2.0.0_neutral_neutral_cw5n1h2txyewy.appx 
Publisher : CN=Microsoft Windows, O=Microsoft Corporation, L=Redmond, S=Washington, 
            C=US\windows.immersivecontrolpanel\APPX,6.2.0.0 
Hash      : 
AppX      : True 

Path      : windows.RemoteDesktop_1.0.0.0_neutral_neutral_cw5n1h2txyewy.appx 
Publisher : CN=Microsoft Windows, O=Microsoft Corporation, L=Redmond, S=Washington, 
            C=US\windows.RemoteDesktop\APPX,1.0.0.0 
Hash      : 
AppX      : True 

Path      : WinStore_1.0.0.0_neutral_neutral_cw5n1h2txyewy.appx 
Publisher : CN=Microsoft Windows, O=Microsoft Corporation, L=Redmond, S=Washington, C=US\WinStore\APPX,1.0.0.0 
Hash      : 
AppX      : True
```

This example outputs the file information for all the packaged applications installed on this machine for all users.



### EXAMPLE 4

```powershell
PS C:\>Get-AppLockerFileInformation -EventLog -EventType Audited
```

This example outputs the file information for all the Audited events in the local event log. Audited events correspond to the Warning event in the AppLocker audit log.



### EXAMPLE 5

```powershell
PS C:\>Get-AppLockerFileInformation -EventLog -EventType Allow -Statistics
```

This example displays statistics for all the Allowed events in the local event log. For each file in the event log, the cmdlet will sum the number of times the event type occurred.



### EXAMPLE 6

```powershell
PS C:\>Get-AppLockerFileInformation -EventLog -EventType Audited | New-AppLockerPolicy -RuleType Publisher, Hash, Path -User Everyone -Optimize | Set-AppLockerPolicy -LDAP LDAP://TestGPO
```

This example creates a new AppLocker policy from the warning events in the local event log and sets the policy of a test Group Policy Object (GPO).



## PARAMETERS

### Directory
Specifies the directory that contains the files for which to get the file information. If all subfolders and files in the specified directory are to be searched, then include the Recurse parameter

```yaml
Type: String
Parameter Sets: Parameter Set 2
Aliases: none

Required: true
Position: named
Default Value: none
Pipeline Input: false
```

### EventLog
Specifies that the file information is retrieved from the event log.

```yaml
Type: SwitchParameter
Parameter Sets: Parameter Set 3
Aliases: none

Required: true
Position: named
Default Value: none
Pipeline Input: false
```

### EventType
Specifies the event type by which to filter the events. The acceptable values for this parameter are: Allowed, Denied, or Audited. The event types correspond to the Informational, Error, and Warning level events in the AppLocker event logs.

```yaml
Type: List<AppLockerEventType>
Parameter Sets: Parameter Set 3
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### FileType
Specifies the generic file type for which to search. All files having the appropriate file name extension will be included. 
The acceptable values for this parameter are: EXE, Script, MSI, and DLL.

```yaml
Type: List<AppLockerFileType>
Parameter Sets: Parameter Set 2
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

### LogPath
Specifies the log name or file path of the event log where the AppLocker events are located. By default, if this parameter is not specified, the local Microsoft-Windows-AppLocker/EXE and DLL channel is used.

```yaml
Type: String
Parameter Sets: Parameter Set 3
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### Packages
Specifies a list of installed packaged applications, from which the file information is retrieved.

```yaml
Type: List<AppxPackage>
Parameter Sets: Parameter Set 4
Aliases: none

Required: false
Position: 1
Default Value: none
Pipeline Input: true (ByValue, ByPropertyName)
```

### Path
Specifies a list of paths to the files from which the file information is retrieved. Supports regular expressions.

```yaml
Type: List<String>
Parameter Sets: Parameter Set 1
Aliases: none

Required: false
Position: 1
Default Value: none
Pipeline Input: true (ByValue, ByPropertyName)
```

### Recurse
Specifies that all files and folders in the specified directory will be searched.

```yaml
Type: SwitchParameter
Parameter Sets: Parameter Set 2
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

### Statistics
Specifies the statistics to retrieve on the files included in the event log. Calculates a simple sum of the number of times a file is included in the event log based on specified parameters.

```yaml
Type: SwitchParameter
Parameter Sets: Parameter Set 3
Aliases: none

Required: false
Position: named
Default Value: none
Pipeline Input: false
```

## INPUTS

### None


## OUTPUTS

### Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.FileInformation


### System.String


## NOTES

## RELATED LINKS

[Online Version:](http://go.microsoft.com/fwlink/?linkid=287248)
[Get-AppLockerPolicy]()
[New-AppLockerPolicy]()
[Set-AppLockerPolicy]()
[Test-AppLockerPolicy]()
[Get-AppxPackage]()

*Generated by: PowerShell HelpWriter 2017 v2.1.33*
