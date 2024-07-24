# Write-Error (non terminating errors)
Write-Error 'Das ist ein Test Error.'

# Verhalten von Write-Error
If (-not (Test-Path C:\sy)) {
    Write-Error "Path not found."
    'Das wird trotzdem ausgefuehrt'
} 

# Kategorie
Write-Error -Message "Error: Too many input values." -Category InvalidArgument

# Get-Error
Get-Error | Select-Object Exception,CategoryInfo | Format-List                      # ruft den letzten Error ab
1/0 # neuen Error erzeugen
Get-Error -Newest 5 | Select-Object Exception,CategoryInfo | Format-List            # ruft x Errors ab
$error | Get-Error

