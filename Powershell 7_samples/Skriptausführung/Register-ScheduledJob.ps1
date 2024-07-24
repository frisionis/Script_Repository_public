# PowerShell 5.1 Scheduled Job startet PS7 Skriptblock
# in PS5 ausfuehren! ==> Stand 2022 keine Kompatibilitaet zu PS7

Register-ScheduledJob -Name Test7 -ScriptBlock {pwsh.exe $home\script.ps1} `
-Trigger (New-JobTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 15) `
-RepeatIndefinitely)
