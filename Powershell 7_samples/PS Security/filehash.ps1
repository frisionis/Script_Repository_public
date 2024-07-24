# Datei file1.ps1 mit einem Inhalt erstellen
New-Item -ItemType File -Path $home\file1.ps1 -Value 'Hello World' -Force

# Filehash anzeigen
Get-FileHash -Path $home\file1.ps1 | Format-List

# Datei file1.ps1 veraendern
Add-Content -Path $home\file1.ps1 -Value 'I am a virus.'

# Filehash der veraenderten Datei abrufen
Get-FileHash -Path $home\file1.ps1 | Format-List


