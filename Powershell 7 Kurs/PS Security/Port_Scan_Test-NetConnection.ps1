# Kerberos (Domain-Controller)
Test-NetConnection -ComputerName 192.168.99.100 -Port 88
# WinRM (PowerShell Remoting)
Test-NetConnection -ComputerName 192.168.99.100 -CommonTCPPort WINRM
# HTTP 
Test-NetConnection -ComputerName 192.168.99.100 -CommonTCPPort HTTP 
# Quiet  
Test-NetConnection -ComputerName sid-500.com -Port 443 -InformationLevel Quiet

# PowerShell 7 Foreach-Object -Parallel
$port = '443','80','53','88'
$port | ForEach-Object -Parallel `
{$a = Test-NetConnection -ComputerName 192.0.78.24 -Port $_ -WarningAction Ignore -InformationLevel Quiet;
Write-Host $_ ':' $a} # 21 Sekunden

$port = '443','80','53','88'
$port | ForEach-Object `
{$a = Test-NetConnection -ComputerName 192.0.78.24 -Port $_ -WarningAction Ignore -InformationLevel Quiet;
Write-Host $_ ':' $a} # 42 Sekunden
