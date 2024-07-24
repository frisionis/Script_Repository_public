# Try-Catch-Finally

# Beispiel 1
Try {
    1/0
}
Catch {
    $_.Exception.Message # Pipeline-Variable ist hier im Catch Block gueltig
}

# Beispiel 2 -ErrorAction Stop (Terminierender Fehler oder nicht?)
Try {
  Get-ChildItem -Path C:\gibtesnicht -ErrorAction Stop
}
Catch {
  Write-Host "Ordner existiert nicht." -ForegroundColor Red
}
Finally {
  Write-Host "Test durchgeführt."
}
 
# Beispiel 3 ErrorAction generell aendern
$ErrorActionPreference = "Stop"
Try {
  Get-ChildItem -Path C:\gibtesnicht
}
Catch {
  Write-Host "Ordner existiert nicht." -ForegroundColor Red
}
Finally {
  Write-Host "Test durchgeführt."
}

# Beispiel 4
$userliste = 'f.bizeps','b.immerfroh','h.gibtesnicht'
foreach ($u in $userliste) {
  Try {
    Get-ADUser -Identity $u
  }
  Catch {
    Write-Output "$u not found."
  }
}