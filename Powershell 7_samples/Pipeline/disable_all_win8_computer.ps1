Get-ADComputer -Properties * -Filter 'operatingsystem -like "*windows 10*"' | 
Set-ADComputer -Enabled $false
