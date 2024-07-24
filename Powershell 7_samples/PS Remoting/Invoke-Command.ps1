# Remoting mit -ComputerName

Get-Command -ParameterName ComputerName # nicht alle Cmdlets unterstuetzen den Parameter!
Get-NetIPAddress -ComputerName mb01 # Error

# Workaround: Den Befehl in Invoke-Command verpacken geht immer!

Get-NetIPAddress -ComputerName mb01 # Error
Invoke-Command -ComputerName mb01 -ScriptBlock {Get-NetIPAddress}
Invoke-Command -ComputerName dc01,mb01 -ScriptBlock {Get-NetIPAddress}

# oder ...
Enter-PSSession ...
New-PSSession ...