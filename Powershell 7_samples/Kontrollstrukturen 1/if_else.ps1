# else

$x = 30
if($x -le 20){
   Write-Host "Das ist das If Statement."
}
else {
   Write-Host "Das ist das Else Statement."
}

###################################################

$computer = '8.8.8.8'
$ping = Test-Connection $computer -Count 1 -Quiet

If ($ping) {
   Write-Host "Ping zu $computer erfolgreich"
}
else {
   Write-Host "Ping zu $computer nicht erfolgreich" -ForegroundColor Red
}