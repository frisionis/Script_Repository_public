# Out-Befehle abrufen
Get-Command -Verb Out

# Out-File 
Get-Process | Out-File $home\process.txt

# Out-Null
Get-ChildItem | Out-Null
$? # war erfolgreich?
Get-ChildItem C:\gibtnesnicht -ErrorAction SilentlyContinue | Out-Null
$?

# Out-GridView
Get-Process | Out-GridView
Get-ADUser -Filter * | Out-GridView
Get-ADUser -Filter * | Out-GridView -PassThru | Disable-ADAccount -Verbose

# Tee-Object 
Get-ADUser -Filter * | Tee-Object -FilePath $home\adusers.txt

# CSV
Get-ADUser -Filter * | Export-Csv $home\aduserscsv.csv
Import-Csv -Path $home\aduserscsv.csv