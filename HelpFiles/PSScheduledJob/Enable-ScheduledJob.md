﻿# Enable-ScheduledJob

## SYNOPSIS
Enables a scheduled job.

## SYNTAX

### Definition
```
Enable-ScheduledJob [-InputObject] <ScheduledJobDefinition> [-PassThru] [<CommonParameters>]
```

### DefinitionId
```
Enable-ScheduledJob [-Id] <Int32> [-PassThru] [<CommonParameters>]
```

### DefinitionName
```
Enable-ScheduledJob [-Name] <String> [-PassThru] [<CommonParameters>]
```

## DESCRIPTION
The Enable-ScheduledJob cmdlet re-enables scheduled jobs that are disabled, such as those that are disabled by using the Disable-ScheduledJob cmdlet. Enabled jobs run automatically when triggered.

To enable a scheduled job, the Enable-ScheduledJob cmdlet sets the Enabled property of the scheduled job to $True. Enabled-ScheduledJob is one of a collection of job scheduling cmdlets in the PSScheduledJob module that is included in Windows PowerShell.

For more information about Scheduled Jobs, see the About topics in the PSScheduledJob module. Import the PSScheduledJob module and then type: \`Get-Help about_Scheduled\*\` or see about_Scheduled_Jobs.

This cmdlet was introduced in Windows PowerShell 3.0.

## EXAMPLES

### Example 1: Enable a scheduled job

```powershell
PS C:\>Enable-ScheduledJob -ID 2 -Passthru
Id         Name            Triggers        Command                                  Enabled
--         ----            --------        -------                                  -------
2          Inventory       {1, 2}          \\Srv01\Scripts\Get-FullInventory.ps1    True
```

This command enables the scheduled job with ID 2 on the local computer. The output shows the effect of the command.

### Example 2: Enable all scheduled jobs

```powershell
PS C:\>Get-ScheduledJob | Enable-ScheduledJob -Passthru
Id         Name            Triggers        Command                                  Enabled
--         ----            --------        -------                                  -------
1          ArchiveProje... {}              C:\Scripts\Archive-DxProjects.ps1        True
2          Inventory       {1, 2}          \\Srv01\Scripts\Get-FullInventory.ps1    True
4          Test-HelpFiles  {1}             .\Test-HelpFiles.ps1                     True
5          TestJob         {1, 2}          .\Run-AllTests.ps1                       True
```

This command enables all scheduled jobs on the local computer. It uses the Get-ScheduledJob cmdlet to get all scheduled job and the Enable-ScheduledJob cmdlet to enable them. Enable-ScheduledJob does not generate warnings or errors if you enable a scheduled job that is already enabled, so you can enable all scheduled jobs without conditions.

### Example 3: Enable selected scheduled jobs

```powershell
PS C:\>Get-ScheduledJob | Get-ScheduledJobOption | Where-Object {$_.RunWithoutNetwork} | ForEach-Object {Enable-ScheduledJob -InputObject $_.JobDefinition}
```

This command enables scheduled jobs that do not require a network connection.

The command uses the Get-ScheduledJob cmdlet to get all scheduled jobs on the computer. A pipeline operator sends the scheduled jobs to the Get-ScheduledJobOption cmdlet, which gets the job options of each scheduled job. Each job options object has a JobDefinition property that contains the associated scheduled job. The JobDefinition property is used to complete the command.

The command uses a pipeline operator (\|) to send the job options to the Where-Object cmdlet, which selects scheduled job option objects in which the RunWithoutNetwork property has a value of True ($true). Another pipeline operator sends the selected scheduled job options objects to the ForEach-Object cmdlet which runs an Enable-ScheduledJob command on the scheduled job in the value of the JobDefinition property of each job options object.

### Example 4: Enable scheduled jobs on a remote computer

```powershell
PS C:\>Invoke-Command -ComputerName "Srv01,Srv10" -ScriptBlock {Enable-ScheduledJob -Name "Inventory"}
```

This command enables scheduled jobs that have "test" in their names on two remote computers, Srv01 and Srv10.

The command uses the Invoke-Command cmdlet to run an Enable-ScheduledJob command on the Srv01 and Srv10 computers. The command uses the Name parameter of Enable-ScheduledJob to enable the Inventory scheduled job on each computer.

## PARAMETERS

### InputObject
Specifies the scheduled job to enable. Enter a variable that contains ScheduledJobDefinition objects or type a command or expression that gets ScheduledJobDefinition objects, such as a Get-ScheduledJob command. You can also pipe a ScheduledJobDefinition object to Enable-ScheduledJob .

```yaml
Type: ScheduledJobDefinition
Parameter Sets: Definition
Aliases: 

Required: true
Position: 0
Default Value: None
Pipeline Input: True (ByValue)
```

### PassThru
Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: false
Position: named
Default Value: False
Pipeline Input: false
```

### Id
Enables the scheduled job with the specified identification number (ID). Enter the ID of a scheduled job.

```yaml
Type: Int32
Parameter Sets: DefinitionId
Aliases: 

Required: true
Position: 0
Default Value: None
Pipeline Input: false
```

### Name
Enables the scheduled jobs with the specified names. Enter the name of a scheduled job. Wildcards are supported.

```yaml
Type: String
Parameter Sets: DefinitionName
Aliases: 

Required: true
Position: 0
Default Value: None
Pipeline Input: false
```

### \<CommonParameters\>
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.PowerShell.ScheduledJob.ScheduledJobDefinition
You can pipe a scheduled job to Enable-ScheduledJob .

## OUTPUTS

### None or Microsoft.PowerShell.ScheduledJob.ScheduledJobDefinition
If you use the Passthru parameter, Enable-ScheduledJob returns the scheduled job that was enabled. Otherwise, this cmdlet does not generate any output.

## NOTES

Enable-ScheduledJob \* does not generate warnings or errors if you use it to enable a scheduled job that is already enabled.

## RELATED LINKS

[Online Version:](http://go.microsoft.com/fwlink/?LinkId=821684)
[Add-JobTrigger]()
[Disable-JobTrigger]()
[Disable-ScheduledJob]()
[Enable-JobTrigger]()
[Enable-ScheduledJob]()
[Get-JobTrigger]()
[Get-ScheduledJob]()
[Get-ScheduledJobOption]()
[New-JobTrigger]()
[New-ScheduledJobOption]()
[Register-ScheduledJob]()
[Remove-JobTrigger]()
[Set-JobTrigger]()
[Set-ScheduledJob]()
[Set-ScheduledJobOption]()
[Unregister-ScheduledJob]()

*Generated by: PowerShell HelpWriter 2017 v2.1.33*
