$i = 14

# While
While ($i -gt 15) {
    Write-Host "Das wird gar nicht ausgeführt."
}

# Do - While
Do {
    Write-Host "Das wird nur einmal ausgeführt! i ist = $i"
} 
while ($i -gt 15)

# Do - Until
Do {
    Write-Host "Das wird immer wieder ausgeführt! i ist = $i"
} 
until ($i -gt 15)