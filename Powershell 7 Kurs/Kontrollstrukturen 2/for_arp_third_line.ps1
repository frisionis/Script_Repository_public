<# Gesucht: Aus dem ARP Cache (Ausgabe blanker Text) sind die IP-Adressen ohne
Multicast Adressen gesucht.
#>

# ARP Eintrag für eine Netzwerkkarte anzeigen

ARP.EXE -a -N 192.168.99.100

# Erste 3 Zeilen entfernen

$a = ARP.EXE -a -N 192.168.99.100 | Select-Object -Skip 3

# Einträge vorbereiten

$b = $a.trim() -replace '\s+',' ' -split '\s' 

# Mit For Schleife jede 3. Zeile abrufen

for ($i=0;$i -lt $b.count;$i+=3) {
    $b[$i] | Where-Object {$_ -notlike "224*" -and $_ -notlike "239*" -and $_ -notlike "*255*"}
}

# !!!!
# Das ganze ohne foreach Schleife mit Regex !

(ARP.EXE -a -N 192.168.0.102 | 
Select-Object -Skip 3).trim() -replace '\s+',' ' -split '\s' | 
Where-Object {$_ -notlike "224*" -and $_ -notlike "239*" -and $_ -notmatch "\-" `
-and $_ -notmatch '[a-z]'}