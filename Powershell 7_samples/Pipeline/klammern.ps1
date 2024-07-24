# Code in runden Klammern () wird SOFORT ausgeführt

(Get-Date).AddYears(-100)

Get-Random –InputObject (1..45) –Count 6

# Code in geschwungenen Klammern {} wird dann ausgeführt wenn er an der Reihe ist

 If (Get-ChildItem C:\gibtesnicht -ErrorAction SilentlyContinue)
{
    Write-Output 'Ordner da.'
}
else 
{ 
    Write-Output 'Ordner nicht da.'
    } 

# Eckige Klammern werden für spezielle Zwecke verwendet

Get-Process [ef]*

$email = 'Patrick.Gruenauer@sid-500.com'
$split = $email.Split('@')
$split[0]

Get-Process [a]*

Get-Process [r-s]*

$array=[array]('Peter','Margit')
$array[0]

[char[]](65..90)


