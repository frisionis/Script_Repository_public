### Computernamen erstellen
$namen = @(
'orf.at'
'sid-500.com'
'8.8.8.8'
'9.9.9.9'
)

### Als Job ping durchfuehren

# Alle Jobs loeschen
Get-Job | Remove-Job 
# Job starten
Start-Job -Name 'ping' `
-ScriptBlock {Test-Connection -ComputerName $using:namen}  # $using: Zugriff auf globale Variable

# ODER 
# $args Contains an array of values for undeclared parameters that are passed to a function, script, or script block.
Start-Job -Name 'ping' `
-ScriptBlock {Test-Connection -ComputerName $args} -ArgumentList $namen 

Start-Job -Name Roles -ScriptBlock {Get-WindowsFeature}

### Job Status abrufen
Get-Job -State 'Running'
Get-Job -Name ping

### Ergebnis abrufen 
Receive-Job -Name ping
Receive-Job -Name roles -Keep
Receive-Job -Name ping -Keep # Ergebnis des Jobs nicht loeschen

