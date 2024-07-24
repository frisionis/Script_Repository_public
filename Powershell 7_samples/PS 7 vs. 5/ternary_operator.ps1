# Ternary Operator: ab PowerShell 7 als Alternative zu If Bedingungen
# <condition> ? <condition-is-true> : <condition-is-false>

# If-Else
If (Test-Path C:\Windows) {
    Write-Host "Verzeichnis vorhanden."
} else {
    Write-Host "Verzeichnis nicht vorhanden."
}

# Ternary Operator
(Test-Path C:\Windows) ? "Verzeichnis vorhanden" : "Verzeichnis nicht vorhanden" # Ternary (dreifach) Operator

0 ? 'true' : 'false'
1 ? 'true' : 'false'
