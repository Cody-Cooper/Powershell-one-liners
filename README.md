# ScheduledTaskAuditor

`ScheduledTaskAuditor.ps1` is a PowerShell script that audits the scheduled tasks on a Windows machine, created for use on OSCP. It filters out default system tasks, tasks created by Microsoft, and certain other specified tasks, providing a clear view of user-created and third-party tasks.

## Features

- **Exclusion of Default Accounts**: Skips tasks that run under default system accounts.
- **Custom Filter Application**: Ignores tasks with specific names that are likely to be benign and routine.
- **Detailed Task Information**: Outputs the task name, run account, author, creation date, last run time, next run time, last run result, and state.
- **Formatted Output**: Presents information in an easy-to-read list format.

## Output Example

The script will output information in the following format:

```
Computer : MYCOMPUTER
TaskName : CustomTaskName
RunAsAccount : DOMAIN\User
Author : User
Created : 10/10/2022 12:00:00 AM
LastRunTime : 11/01/2023 5:00:00 AM
NextRunTime : 11/08/2023 5:00:00 AM
LastRunResult : 0
State : Ready
```

This output can then be redirected to a file or processed further as needed.

