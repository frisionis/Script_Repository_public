# PS Drives anzeigen
Get-PSDrive

# PS Drive wechseln und navigieren
Set-Location hklm:
Test-Path .\HARDWARE
cd c:

# Ein eigenes PS Laufwerk erstellen
New-PSDrive -Name Module -PSProvider FileSystem -Root 'C:\Program Files\PowerShell\Modules'
Set-Location module:
