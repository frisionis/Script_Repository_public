# while 

# Beispiel 1
$i = 0
while ($i -lt 10) {
    "i ist $i"
    $i++
}

# Beispiel 2
while ($true) {
    Write-Host "Das ist eine Endlosschleife mit while."
}

# Beispiel 3
Get-Process Notepad -ErrorAction SilentlyContinue | Stop-Process # Vorbereitung
Remove-Variable notepad -ErrorAction SilentlyContinue # Vorbereitung

$notepad = Get-Process notepad -ErrorAction SilentlyContinue
While ($notepad.Count -lt 5) {
    Start-Process Notepad.exe
    $notepad = Get-Process Notepad
}
