$defaultAccounts = @("Administrator", "DefaultAccount", "Guest", "WDAGUtilityAccount", "SYSTEM", "Microsoft Corporation", "Microsoft");
Get-ScheduledTask | 
    Where-Object { 
        $_.TaskName -notmatch "GoogleUpdate" -and 
        $_.TaskName -NotMatch "User_Feed_Synchronization" -and 
        $_.TaskName -notmatch "Optimize Start Menu" -and 
        $_.Principal.UserId -notmatch "SYSTEM" -and 
        $_.Author -and 
        -not ($defaultAccounts -contains ($_.Author -split '\\')[-1]) -and
        $_.Author -notmatch "Microsoft Corporation" -and
        $_.Author -notmatch "Microsoft"
    } | 
    ForEach-Object { 
        $taskInfo = $_ | Get-ScheduledTaskInfo; 
        [PSCustomObject] @{
            Computer = $env:COMPUTERNAME; 
            TaskName = $_.TaskName; 
            RunAsAccount = $_.Principal.UserId; 
            Author = $_.Author; 
            Created = $_.Date; 
            LastRunTime = $taskInfo.LastRunTime; 
            NextRunTime = $taskInfo.NextRunTime; 
            LastRunResult = $taskInfo.LastTaskResult; 
            State = $_.State 
        } 
    } | Format-List
