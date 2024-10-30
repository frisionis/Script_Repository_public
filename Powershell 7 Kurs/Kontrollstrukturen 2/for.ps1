# For

for ($i=0; $i -le 10; $i++) {
        $i
    }

for ($i=10; $i -ge 0; $i--) {
        $i
    }

for ($i = 0; $i -le 20; $i += 2) {
    Write-Host $i
}

for ($i = 20; $i -ge 0; $i -= 3) {
    Write-Host $i
}

for ($i=1;$i -le 15;$i++) {
    Write-Host "This is the color for [$i]" -ForegroundColor $i
}
