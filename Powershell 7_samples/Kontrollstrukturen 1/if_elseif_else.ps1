"
1: Notepad
2: Explorer
3: Netzwerkverbindungen
"
$read = Read-Host "Wählen Sie"

If ($read -eq '1') {
    Start-Process notepad
}
Elseif ($read -eq '2') {
    Start-Process explorer
}
ElseIf ($read -eq '3') {
    Start-Process ncpa.cpl
}
Else {
    Write-Host 'Ungültige Eingabe.'
}