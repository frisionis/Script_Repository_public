# $? ==> war der letzte Befehl erfolgreich (=true) ?
$?
Stop-Process notepad
$?

# If statement
# True
Get-ChildItem C:\Windows -ErrorAction Ignore | Out-Null
If ($?) {
    Start-Process explorer C:\Windows
} else {
    "Folder not found."
}

# False
Get-ChildItem C:\gibtesnicht -ErrorAction Ignore | Out-Null
If ($?) {
    Start-Process explorer C:\Windows
} else {
    "Folder not found."
} 

# $? anstelle von ...
$test = Get-ChildItem C:\gibtesnicht -ErrorAction Ignore | Out-Null
If ($test) {
    Start-Process explorer C:\Windows
} else {
    "Folder not found."
} 
