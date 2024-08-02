Get-Process | Where-Object CPU -GT 10
Get-Process | Where-Object {$PSitem.CPU -GT 10}
Get-Process | Where-Object {$_.CPU -GT 10 -and $_.Handles -lt 1000}

