# Vergleich Variablen in PS5 und PS7

Get-Variable | Select-Object -ExpandProperty Name | Out-File $home\ps5var.txt # In PS5 ausfuehren!
Get-Variable | Select-Object -ExpandProperty Name | Out-File $home\ps7var.txt

Compare-Object -ReferenceObject (Get-Content $home\ps5var.txt) `
-DifferenceObject (Get-Content $home\ps7var.txt)
