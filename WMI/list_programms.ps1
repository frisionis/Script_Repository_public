#powershell_7
#
#Abfrage der installierten Programme mittels WMI
#
#erstellt 20240724 - Daniel Frisardi
#
# Version 1.0
#
#freigegeben - 20240724 - Daniel Frisardi
##########################################################
#keine weiteren Kommentare und Infos
# 
###########################################################

Get-WmiObject -Class Win32_Product | Select-Object -Property Name, Version