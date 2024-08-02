# Attribute abrufen
Get-Process | Get-Member 
Get-Process | Get-Member -MemberType Properties # genauer
Get-Process explorer | Select-Object -Property * # Alle Attribute abrufen
Get-Process code | Select-Object ProcessName,CPU # Bestimmte Attribute abrufen
Get-Process code | Select-Object -ExpandProperty CPU # Nur den Wert abrufen
(Get-Process explorer).CPU # Alternative: ().Attribut

# um dann etwas zu tun ...
Get-Process | Where-Object CPU -GT 10
Get-Process | Where-Object CPU -GT 10 | Sort-Object CPU | Select-Object ProcessName,Id,CPU | 
ConvertTo-Html | Add-Content $home\prozesse.htm
Start-Process $home\prozesse.htm

# In Active Directory Vorsicht !
Get-ADUser -Identity administrator | Get-Member # zu wenig? JA 
Get-ADUser -Identity administrator -Properties * | Get-Member # Alle Attribute abrufen
Get-ADUser -Identity administrator | Select-Object * # ebenfalls zu wenig
Get-ADUser -Identity administrator -Properties * | Select-Object LastLogonDate # gut, aber nicht perfekt
Get-ADUser -Identity administrator -Properties LastLogonDate | Select-Object LastLogonDate  # perfekt
Get-ADUser -Identity administrator -Properties LastLogonDate | Select-Object LastLogonDate

# Wichtiges Attribut: Count!
(Get-ADUser -Filter *).Count
Get-ADUser -Filter * | Measure-Object # Alternative
Get-ADUser -Filter * | Measure-Object | Select-Object -ExpandProperty Count
Get-ADUser -Filter * | Get-Member # kein Count
Get-ChildItem | Get-Member # Length = Count




