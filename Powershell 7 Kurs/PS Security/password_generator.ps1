# Vorbereitungen 
$null | Set-Clipboard
$alphabetu = [char[]](65..90)
$alphabetl = [char[]](97..122)
$character = '+#()%$:,?!&'.ToCharArray()
$digits    = 0..9
$pwlaenge  = Read-Host 'Passwortlänge (min. 12 Zeichen)'

If ($pwlaenge -ge 12) {
$password = ($alphabetu,$alphabetl,$character,$digits | Get-Random -Count $pwlaenge) -join ''
$password | Set-Clipboard

Clear-Host
Write-Output "Your password:`n$password"
Write-Warning "Password saved to clipboard for 20 seconds."
Start-job -Name Sleep {Start-Sleep 20; $null | Set-Clipboard} | Out-Null
} else {
    throw 'Error. Please provide a minimum length of 12.'
}