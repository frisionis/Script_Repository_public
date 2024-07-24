# Systemvariablen
Get-Variable 
$ErrorActionPreference="SilentlyContinue"
$HOME
$PID
$PWD
$PSVersionTable.PSVersion


# Variablen selbst erstellen
$name = 'Patrick Gruenauer','Arnold Schwarzenegger'
$name.Length
$name.Split(' ')
$name1 = 'Arnold Schwarzenegger'
$name2 = '   Sylvester Stallone    '
$name2.Trim()
Compare-Object $name1 $name2

$win = 'C:\Windows\system32'
Test-Path $win

$prozesse = Get-Process
$prozesse.Count

$dienste=Get-Service
$dienste.Count

$Today = (Get-Date).Date
$Today.AddYears(-100)

$servers = (Get-ADComputer -Filter 'operatingsystem -like "*server*"-and enabled -eq "true"').Name
Restart-Computer -ComputerName $servers -Force

$z = 1,2,3
$z[0]

$a = '1'
$b = '2'
$a - $b


