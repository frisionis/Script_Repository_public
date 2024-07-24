# Read-Host speichert die Eingabe des Benutzers 

$comp = Read-Host -Prompt 'Enter Computername'
Test-Connection $comp

$cred = Read-Host -Prompt "Enter password" -AsSecureString    # Passwörter speichern

# Write-Host gibt etwas in der Konsole aus

Write-Host "Hello World" -ForegroundColor Red -BackgroundColor Green

Write-Host "Das ist ein Beispiel`neines Zeilenumbruchs"
