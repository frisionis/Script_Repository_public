# Grundlagen

# -eq
'abc' -eq 'abc'
'abc' -eq 'abc', 'def'
'abc', 'def' -eq 'abc'

# Gemischt
[ipaddress]$a = '192.168.1.1'
$a -is [ipaddress]
$a -isnot [string]
$a -ne '192.168.0.1'
$a -eq '192.168.1.2'
$a -eq '192.168.1.1'
$a -like '192.*'
$a -contains ''
$a -contains '192.168.1.1'

$b = 10
$b -le 10
$b -gt 9
$b -ge 10
$b -lt 9

$c = 8
$d = 9
$c -or $e
$c -or $d
$c -xor $d
$c -xor $z
$c -and $e

### Praxisbeispiel ###

$server = (Get-ADComputer -Filter 'operatingsystem -like "*server*"').Name
Get-CimInstance win32_operatingsystem -ComputerName $server | 
Select-Object -Property PSComputerName,Caption,InstallDate,LastBootUpTime |
Out-File $home\Test.txt

# Does it contain letters ? ==> '\w'
'Patrick' -match '\w'
# Does it contain digits ? ==> '\d'
'Patrick' -match '\d'
# Groß oder Kleinbuchstaben ?
'Patrick' -match 'p' # ????
'Patrick' -cmatch 'p' # OK

