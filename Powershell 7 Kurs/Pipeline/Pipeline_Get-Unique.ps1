########## Pipeline Beispiel ##########

# Vorbereitung #

### Eine Datei mit Werten erstellen

New-Item -ItemType File -Path $home\usernames.txt -Force

### Inhalte (tlw. doppelte Namen) hinzufuegen
Add-Content -Path $home\usernames.txt `
-Value 'Hans','Patrick','Patrick','Herbert','Kevin','Herbert'

### Dateiinhalt abrufen (PowerShell speichert mehrere Wert als Array)
Get-Content $home\usernames.txt 

# Beweis das es ein Array ist: 3 Werte abrufen
(Get-Content $home\usernames.txt)[0..2] 

# Ende der Vorbereitung #


### Inhalt abrufen, einzigartige Namen aufrufen und in neuer Datei speichern

Get-Content -Path $home\usernames.txt |
Sort-Object | # ist notwendig, weil Get-Unique nur zusammenhaengende Daten erkennt
Get-Unique |
Add-Content -Path $home\usernames_unique.txt

Get-Content -Path $home\usernames_unique.txt

### Objekte (Namen) zaehlen
Get-Content -Path $home\usernames_unique.txt | Measure-Object
(Get-Content -Path $home\usernames_unique.txt).Count ####  ().Count ist fuer alle Cmdlets verfÃ¼gbar

### Vergleichen

Compare-Object -ReferenceObject (Get-Content $home\usernames.txt) -DifferenceObject (Get-Content $home\usernames_unique.txt)
Compare-Object -ReferenceObject (Get-Content $home\usernames.txt) -DifferenceObject (Get-Content $home\usernames_unique.txt) -PassThru
