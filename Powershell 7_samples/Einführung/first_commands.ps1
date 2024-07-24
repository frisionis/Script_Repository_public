Start-Transcript

Set-Location HKLM:

Set-Location C:\
Get-PSDrive

Get-ChildItem -Path C:\Windows\Panther -Recurse | 
Select-String 'first boot' | 
Select-Object -Last 1

Get-NetIPConfiguration

Start-Sleep 10; Restart-Computer -Force -Confirm

Test-NetConnection 8.8.8.8 -Port 53

Test-Connection orf.at,8.8.8.8 -Count 1 -Quiet

Start-BitsTransfer `
-Source https://patrick6649.files.wordpress.com/2018/05/arnolds-6-rules-of-success.jpg `
-Destination (Join-Path -Path $home -ChildPath Downloads)


Start-Process (Join-Path -Path $home -ChildPath Downloads)

$comp = Read-Host -Prompt 'Enter Computername'
Test-Connection -ComputerName $comp -Count 1

Write-Host $comp

Write-Host "Hallo!`nPatrick"

Stop-Transcript
