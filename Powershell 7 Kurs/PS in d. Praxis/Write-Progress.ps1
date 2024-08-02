# Write-Progress 
$progress = @{
    Activity = 'Retrieving data ...'
    CurrentOperation = "Loading"
    PercentComplete = 0
    Status = 'Starting...'
}
Write-Progress @progress

# Script example
$numbers = 1..99
$count = $numbers.count
foreach ($n in $numbers) {
    "Computer0$n"
    Write-Progress -Activity 'Enumerate Computers' `
    -CurrentOperation Computer0$n `
    -Status "$(([math]::Round((($n)/$count * 100),0))) %"
    Start-Sleep -Seconds 1
 }

 <# Progress Bar in PowerShell 5.1 und PowerShell 7 ist grafisch unterschiedlich.
 $PSStyle.Progress (Standard PS7: Minimal)
 $PSStyle.Progress.View = 'Classic' (Ansicht wie bei PS5.1)
 #>


