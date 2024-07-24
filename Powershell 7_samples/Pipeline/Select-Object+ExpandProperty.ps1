# Select-Object -ExpandProperty oder ().x sind Schluesseltechnologien

# Ein Beispiel der Problematik ...
$comp = Get-ADComputer -Filter * | Select-Object -Property Name
Test-Connection -ComputerName $comp

# ... die Loesung ... -ExpandProperty !
$comp = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name
Test-Connection -ComputerName $comp

# oder mit der .Net 
$comp = (Get-ADComputer -Filter *).Name
Test-Connection -ComputerName $comp

# weiteres Beispiel
$boot1 = Get-ComputerInfo | Select-Object OsLastBootUpTime
(Get-Date) - $boot1
$boot2 = Get-ComputerInfo | Select-Object -ExpandProperty OsLastBootUpTime
(Get-Date) - $boot2
$boot3 = (Get-ComputerInfo).OsLastBootUpTime 
(Get-Date) - $boot3
