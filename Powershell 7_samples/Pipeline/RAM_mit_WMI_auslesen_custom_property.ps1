Get-CimInstance -Class Win32_PhysicalMemory  | 
Select-Object Manufacturer,BankLabel,ConfiguredClockSpeed,`
SerialNumber, @{n="RAM"; e={[Math]::Round($_.Capacity/ 1GB)}} | 
Format-Table
