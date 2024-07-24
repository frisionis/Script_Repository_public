# Alte Datei erstellen
New-Item -ItemType File -Path $home\dateiold.txt -Force
(Get-ChildItem -Path $home\dateiold.txt).LastWriteTime='01.01.1812 19:00' # ;-)

# Funktion erstellen: Alle Dateien des 19. Jahrhunderts und davor löschen
Function Delete-OldFiles {
Get-ChildItem $home\*.* | 
Where-Object LastWriteTime -le '01.01.1900 00:00' |
Remove-Item -Force -Verbose
}

# oder
Get-ChildItem $home\*.* | 
Where-Object LastWriteTime -le '01.01.1900 00:00' |
Remove-Item -Force -Verbose


