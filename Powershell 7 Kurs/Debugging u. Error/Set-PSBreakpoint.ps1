# Skript erstellen
New-Item -ItemType File -Path $home\forSchleife.ps1 -Value '
for ($i = 0; $i -lt 10; $i++) {
    $i
}
'

# BreakPoint setzen
Set-PSBreakpoint -Script "$home\forSchleife.ps1" `
-Variable i `
-Action `
{ if ($i -gt 2) 
    { break } 
}

# Skript ausführen 
&"$home\forSchleife.ps1" # Call Operator
