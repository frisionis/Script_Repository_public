# If 

$i = 14
If ($i -eq 14) {
    Write-Host '$i ist 14'
}

$i = 14
$u = 20
If ($i -eq 12 -or $u -lt 30) {
    Write-Host 'Bedingung erfuellt.'
}

If (Test-Path C:\Windows) {
    Write-Host "Windows Folder existiert."
}

$test = Test-Path C:\Windows
If ($test) {
    Write-Host "Windows Folder existiert."
}

$test = Test-Path C:\gibtesnicht
If (-not $test) {
    Write-Host "Existiert nicht."
}

$test = Test-Path C:\gibtesnicht
If (!$test) {
    Write-Host "Existiert nicht."
}

