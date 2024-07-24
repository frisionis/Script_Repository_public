# Switch 
"
1: Notepad
2: Explorer
3: Netzwerkverbindungen
"
$read = Read-Host "Wählen Sie"

switch ($read) {

    1 {Start-Process notepad}
    2 {Start-Process explorer}
    3 {Start-Process ncpa.cpl}
    default {Write-Host 'Ungültige Eingabe'}

}