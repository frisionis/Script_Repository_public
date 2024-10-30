### Foreach-Object -Parallel in PowerShell 7

$comp = '8.8.8.8','orf.at','9.9.9.9'

# PowerShell 5
Measure-Command {
$comp | ForEach-Object {Test-Connection -ComputerName $_}
}  | Select-Object -Property Seconds

# PowerShell 7
Measure-Command {
    $comp | ForEach-Object -Parallel {Test-Connection -ComputerName $_}
    }  | Select-Object -Property Seconds

# oder ...
Measure-Command  {
foreach ($c in $comp) {
    Test-Connection -ComputerName $c
    }
} | Select-Object -Property Seconds

############################################################################

# Default Threads in Foreach-Object -Parallel: 5 !
$comp = '8.8.8.8','orf.at','9.9.9.9','192.168.0.100','sid-500.eu','sid-500.com','uhrforum.de'

# PowerShell 5
Measure-Command {
    $comp | ForEach-Object {Test-Connection -ComputerName $_ -ErrorAction SilentlyContinue}
    }  | Select-Object -Property Seconds

# PowerShell 7
Measure-Command {
    $comp | ForEach-Object -Parallel {Test-Connection -ComputerName $_ -ErrorAction SilentlyContinue} -ThrottleLimit 7
    }  | Select-Object -Property Seconds