# Select-String Beispiele
'Hello', 'HELLO' | Select-String -Pattern 'HELLO' -CaseSensitive 

$Events = Get-WinEvent -LogName Application -MaxEvents 50
$Events | Select-String -InputObject {$_.message} -Pattern 'Fehler'

# ganz ohne Pipeline ...
Select-String -Path C:\Windows\Panther\setupact.log -Pattern 'First Boot'