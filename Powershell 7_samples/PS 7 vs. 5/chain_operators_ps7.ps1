### && Only executed, if the first command was successful

Get-ChildItem C:\notthere -ErrorAction SilentlyContinue && 'Not there'

Get-Process notepad -ErrorAction SilentlyContinue | Out-Null && Stop-Process -Name notepad

### || Only executed if the first command was unsuccessful

Get-ChildItem C:\NotExist -ErrorAction SilentlyContinue || 'Not there'

Get-Process notepad -ErrorAction SilentlyContinue || Start-Process notepad
