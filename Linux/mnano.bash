#!/bin/bash
#
#Editor Skript
#
#erstellt 20190829 - dfrisardi
#
# Version 0.1
#
#freigegeben - 20190829 - dfrisardi
##########################################################

#Namensabfrage der zu erstellenden Datei
echo "Welchen Dateinamen möchten Sie ihrem Script geben?"      

#Dateinamen eingeben
read antwort

#Bestätigung des Names
echo "Ihr Script mit dem Namen $antwort wurde erstellt und wird in Kürze geöffnet"

#Dateianlage
echo "#!/bin/bash" >> /home/linux/scripts/$antwort 

#Variablen zu Datum und User festlegen
date=$(date --utc --date "$1" +%F)
id=$(hostname)

#File Header anlegen
echo "#Das Script wurde am $date vom Benutzer $id erstellt" >> /home/linux/scripts/$antwort 
echo "#" >> /home/linux/scripts/$antwort 

#Zugriffsrechte festlegen
chmod 750 /home/linux/scripts/$antwort

exit
