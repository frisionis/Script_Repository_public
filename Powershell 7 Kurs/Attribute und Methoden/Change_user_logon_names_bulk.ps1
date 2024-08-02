Get-ADUser -Filter * -SearchBase "OU=HR,DC=PAGR,DC=INET" |
Foreach-Object `
{
Set-ADUser `
$_ -SamAccountName ($_.givenname.substring(0,1) + '.' + $_.surname).tolower() `
-UserPrincipalName (($_.givenname.substring(0,1) + '.' + $_.surname).tolower() + "@" + "$env:userdnsdomain") `
-Verbose
}