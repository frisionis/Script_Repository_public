Get-Process | Format-Table Id,ProcessName # Tabellen aussuchen
Get-Process | Format-Table CPU(s) # CPU(s) gibt es nicht
Get-Process | Get-Member # Was gibt es?

Get-Service | Format-Table -Wrap -AutoSize # Zeilenumbruch, Anpassen der Fenstergroesse

Get-Process | Format-List Id,ProcessName 

Get-Process | Format-Wide

'Patrick','Patrick','Herbert','Patrick' | Format-Table | Sort-Object | Get-Unique # funktioniert nicht
Get-Process | Format-Table Id,ProcessName | Out-File $home\process.txt # Das ist ok.

