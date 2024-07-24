# Sort-Object 
Get-Process | Sort-Object CPU -Descending

# Select-Object 
Get-Process | Select-Object CPU,Id,ProcessName -Last 3

# Gemischt 
Get-Process | Sort-Object CPU -Descending | Select-Object ProcessName,CPU -First 3

# Was gibt es alles ? 
Get-Process | Get-Member
Get-Process | Select-Object -Property *
