#Verbindung zum Configuration Manager COM-Objekt
$conman = new-object -com "UIResource.UIResourceMgr"
$cache = $conman.GetCacheInfo()
 
#Elemente zwischenspeichern, Datum vergleichen und löschen, die älter als 60 Tage sind
$cache.GetCacheElements()  | foreach {$cache.DeleteCacheElement($_.CacheElementID)}

#löschen aller Ordner
Get-ChildItem -Path C:\Windows\ccmcache\* | Where-Object {$_.CreationTime -lt (Get-Date).AddDays(-1)} | Remove-Item -Force -Recurse
