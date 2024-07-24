### Ordner mit Umlauten finden ###

# Datei mit Umlaut erstellen

Remove-Item $home\*.txt -Force

New-Item $home\datü.txt -Force
New-Item $home\datö.txt -Force
Get-ChildItem $home\* -Include '*.txt'
Clear-Host

<#
Und Action:
Zeile 19  : Rufe alle Files aus $home ab
Zeile 20  : Wo der Dateiname nicht a-z oder A-Z oder 0-9 ... (RegEx Statement)
Zeile 21  : Bennene die Dateien um und ersetze ü mit ue, ä mit ae ...
#> 

Get-ChildItem -Path $home -File | 
Where-Object {$_.Name -match '[^a-zA-Z0-9.()_ ]'} | 
Rename-Item -NewName {$_.Name -replace 'ü','ue' -replace 'ä','ae' -replace 'ö','oe'} -WhatIf

Get-ChildItem -Path $home -File | 
Where-Object {$_.Name -match '[^a-zA-Z0-9.()_ ]'} | 
Rename-Item -NewName {$_.Name -replace 'ü','ue' -replace 'ä','ae' -replace 'ö','oe'} -Verbose

# Überprüfen

Get-ChildItem $home -File *.txt

