# Pipline Variablen: $_ und $PSItem
Get-Process | Where-Object {$_.CPU -lt 10 -and $PSItem.Handles -gt 10}

# $args : $args is an array of the arguments that are passed into the script
function Google {
    Start-Process "https://www.google.at/search?q=$args"
    }

# $true oder $false
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableRealtimeMonitoring $false

# $null : send to null
$null = New-Item -ItemType File -Path $Home\keineausgabe.txt -Force

# $home 
Get-ChildItem $Home 

# $host
$Host
$Host.ui.RawUI.BackgroundColor
$Host.ui.RawUI.BackgroundColor = 'Green'
$Host.ui.RawUI.BackgroundColor = 'Black'

# $pwd
$pwd