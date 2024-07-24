# $Error ==> Speichert Fehler
$error # Sind Fehler vorhanden?
$error.Clear() # loescht alle Errors

# Fehler erzeugen und abrufen
Get-ChildItem C:\nothere
$error.CategoryInfo

Enter-PSSession notexisting
$error[0].CategoryInfo

$error.Count

# Welche Error Attribute gibt es ?
$error[0] | Get-Member
$error[0].InvocationInfo.Line

# Fehler werden in einem Array gespeichert
$error[1]
$error[0..2]

# Try-Catch-Finally 
$error.Clear()
Try {
    1/0
}
Catch {
    $Error.CategoryInfo
    $Error.InvocationInfo.PositionMessage
}

