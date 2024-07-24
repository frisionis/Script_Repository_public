### Get-Date ist ein Objekt des Typs Datum

Get-Date
(Get-Date).GetType()                            	    # Den Objekt-Typ anzeigen
Get-Date | Get-Member                                   # Was kann man damit tun?
(Get-Date).AddDays(-21)                                 # Mit dem Objekt-Typ Datum rechnen
(Get-Date).                                             # Was gibt es so alles ?
(Get-Date) – (Get-Date –Day 23 –Month 03 –Year 1976)    # Wie viele Tage bin ich schon auf dieser Welt ?


### String-Objekte

'Patrick'.GetType()                                     # Patrick ist eine Zeichenkette und kein Datum
'Patrick' | Get-Member                                  # Was kann man damit tun?
'patrick'.Substring(0,1).ToUpper()                      # Das erste Zeichen aufrufen und in Großbuchstaben setzen
'patrick'.AddDays(-21)                                  # ?

### Unterscheidung der Objekttypen

(Get-Date).substring(0,2)                               # Funktioniert nicht, da keine Zeichenkette

(Get-Date).ToString().Substring(0,2)                    # Ein Datumsobjekt in einen String umwandeln

(Get-Date) - 'Patrick'   