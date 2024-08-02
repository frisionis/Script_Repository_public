### throw : generiert einen terminierenden Fehler

throw 'This is an error.'

# If Bedingung
$error.Clear()
$i = 2
 
If ($i -gt 1) {
throw '$i greater than 1'
} 

$error
$error.TargetObject 