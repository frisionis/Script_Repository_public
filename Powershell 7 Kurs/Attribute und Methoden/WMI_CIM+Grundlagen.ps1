# WMI Klassen aufrufen
Get-CimInstance -ClassName win32_ # STRG + Leertaste fuer die Auflistung (nur in pwsh.exe)

# Klasse Operatingsystem
Get-CimInstance Win32_OperatingSystem 
Get-CimInstance Win32_OperatingSystem | Get-Member
Get-CimInstance Win32_OperatingSystem | Select-Object *
Get-CimInstance Win32_OperatingSystem | Select-Object xxxx,xxxx

# Remoteaufruf
Get-CimInstance win32_operatingsystem -ComputerName mb01