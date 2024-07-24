# Remoting mit -ComputerName
Get-Hotfix -ComputerName mb01
Restart-Computer -ComputerName mb01,srv-mb02
Get-WindowsFeature -ComputerName mb01 -Name 'XPS-Viewer'
Install-WindowsFeature -ComputerName mb01 -Name 'XPS-Viewer'
Get-Command -ParameterName ComputerName # nicht alle Cmdlets unterstuetzen den Parameter!
Get-NetIPAddress -ComputerName mb01 # Error