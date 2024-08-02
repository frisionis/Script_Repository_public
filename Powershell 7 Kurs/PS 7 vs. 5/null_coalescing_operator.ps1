# Null coalescing: Wenn etwas null ist dann ...

# Einfaches Beispiel
$null ?? 'Wert ist null.'
0 ?? 'Wert ist null.'

# Existiert die Datei? Nein, dann erstelle sie 
(Get-ChildItem $home\log.txt -ErrorAction SilentlyContinue) ?? 
(New-Item -ItemType File -Path $home\log.txt)
 
# Ist das Exchange Online Modul installiert? Wenn nein, dann ...
(Get-Module -Name 'ExchangeOnlineManagement' -ListAvailable) ??
(Install-Module -Name 'ExchangeOnlineManagement')
 
# Prozess gestartet ? Wenn nein, dann ...
(Get-Process -Name notepad -ErrorAction SilentlyContinue) ??
(Start-Process notepad)