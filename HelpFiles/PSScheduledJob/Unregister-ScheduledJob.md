# Unregister-ScheduledJob

## SYNOPSIS
Deletes scheduled jobs on the local computer.

## SYNTAX

### Definition
```
Unregister-ScheduledJob [-InputObject] <ScheduledJobDefinition[]> [-Force] [<CommonParameters>]
```

### DefinitionId
```
Unregister-ScheduledJob [-Id] <Int32[]> [-Force] [<CommonParameters>]
```

### DefinitionName
```
Unregister-ScheduledJob [-Name] <String[]> [-Force] [<CommonParameters>]
```

## DESCRIPTION
The Unregister-ScheduledJob cmdlet deletes scheduled jobs from the local computer.

When it deletes or unregisters a scheduled job, Unregister-ScheduledJob deletes the directory for the scheduled job (in the $home\\AppData\\Local\\Microsoft\\Windows\\PowerShell\\ScheduledJobs directory), which contains the XML file that defines the scheduled job, the job execution history, and all job results. This action also deletes the job from Task Scheduler. Unregister-ScheduledJob deletes only the scheduled jobs that are created by using the Register-ScheduledJob cmdlet. It does not delete scheduled jobs that are created in Task Scheduler.

You can use the parameters of Unregister-ScheduledJob to delete scheduled jobs by ID or name, or pipe scheduled jobs from Get-ScheduledJob to Unregister-ScheduledJob . Unregister-ScheduledJob is one of a collection of job scheduling cmdlets in the PSScheduledJob module that is included in Windows PowerShell.

For more information about Scheduled Jobs, see the About topics in the PSScheduledJob module. Import the PSScheduledJob module and then type: \`Get-Help about_Scheduled\*\` or see about_Scheduled_Jobs.

This cmdlet was introduced in Windows PowerShell 3.0.

## EXAMPLES

### Example 1: Delete a scheduled job

```powershell
PS C:\>Unregister-ScheduledJob TestJob
```

This command deletes the TestJob scheduled job on the local computer.

### Example 2: Delete all scheduled jobs

```powershell
PS C:\>Get-ScheduledJob | Unregister-ScheduledJob -Force
PS C:\>Unregistered-ScheduledJob -Name "*" -Force
```

This example shows two different commands that delete all scheduled jobs on the local computer.

The first command uses the Get-ScheduledJob cmdlet to get all scheduled jobs on the local computer. A pipeline operator (\|) sends the scheduled jobs to Unregister-ScheduleJob , which deletes them.

The second command uses the Name parameter of Unregister-ScheduledJob with a value of all (\*) to delete all scheduled jobs.

Both commands use the Force parameter, which deletes a scheduled job even if an instance of the job is running.

### Example 3: Delete a scheduled job on a remote computer

```powershell
PS C:\>Invoke-Command -ComputerName "Server01" { Unregister-ScheduledJob -Name "Test*"}
```

This command deletes scheduled jobs with names that begin with Test on the Server01 remote computer. The command uses the Invoke-Command cmdlet to run the Unregister-ScheduledJob command on the Server02 computer.

## PARAMETERS

### InputObject
Specifies a scheduled job. Enter a variable that contains ScheduledJob objects or type a command or expression that gets ScheduledJob objects, such as a Get-ScheduledJob command. You can also pipe ScheduledJob objects to Unregister-JobTrigger .

```yaml
Type: ScheduledJobDefinition[]
Parameter Sets: Definition
Aliases: 

Required: true
Position: 0
Default Value: None
Pipeline Input: True (ByValue)
```

### Force
Deletes the scheduled job even if an instance of the job is running. By default, Unregister-ScheduledJob does not interrupt running jobs.

```yaml
Type: SwitchParameter
Parameter Sets: Definition
Aliases: 

Required: false
Position: named
Default Value: False
Pipeline Input: false
```

### Id
Deletes the scheduled jobs with the specified identification numbers (ID). Enter the IDs of scheduled jobs on the computer.

```yaml
Type: Int32[]
Parameter Sets: 
Aliases: 

Required: true
Position: 0
Default Value: None
Pipeline Input: false
```

### Name
Deletes the scheduled jobs with the specified names. Enter the names of one or more scheduled jobs on the computer. Wildcards are supported.

```yaml
Type: String[]
Parameter Sets: 
Aliases: 

Required: true
Position: 0
Default Value: None
Pipeline Input: false
```

### <CommonParameters\>
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.PowerShell.ScheduledJob.ScheduledJobDefinition
You can pipe scheduled jobs to Unregister-ScheduledJob

## OUTPUTS

### None
This cmdlet does not generate any output.

## NOTES



## RELATED LINKS

[Online Version:](http://go.microsoft.com/fwlink/?LinkId=821707)
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
