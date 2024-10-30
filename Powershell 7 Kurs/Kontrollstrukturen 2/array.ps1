### Arrays sind immer von fixer Groesse ###
### += erstellt ein neues Array und fuegt den Eintrag hinzu ### 

# PowerShell speichert immer als Array wenn nichts anderes angegeben wird
$liste = 'Peter','Margit','Hans','Michael','Mona'
$liste.GetType()
$liste[0]
$liste[1]

[array]$liste2 = 'Peter','Margit','Hans','Michael','Mona' # nicht noetig, aber hilfreich
$liste2.GetType()
$liste2[0..2]
$liste2[-1..-3]
$liste2[1][3] # ==> g von Margit 

# Hinzufuegen von weiteren Werten 
$liste2.add('Hansjuergen') # Error 
$liste2 += 'Hansjuergen'
$liste2

# Weitere Beispiele 
(Get-Service).GetType()
(Get-Service)[0]
(Get-Service)[0..3]
(Get-Service)[-1]

$folders = Get-ChildItem -Directory -Path C:\
$folders.GetType()
$folders[0..4] # oder 
$folders | Select-Object -First 4
