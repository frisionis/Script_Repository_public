# Create users from text file (format: givenname surname)

# Provide password for all users
$pass = '1234user!'

Get-Content $home\users.txt | 
ForEach-Object {
    $Split = $_.Split(" ") 
    $given = $Split[0] -creplace 'ä','ae' -creplace 'Ä','Ae' -creplace 'ö','oe' -creplace 'Ö','Oe' -creplace 'ü','ue' -creplace 'Ü','Ue' 
    $sur = $Split[1] -creplace 'ä','ae' -creplace 'Ä','Ae' -creplace 'ö','oe' -creplace 'Ö','Oe' -creplace 'ü','ue' -creplace 'Ü','Ue' 
    New-ADUser `
    -GivenName $given `
    -Surname $sur `
    -Name ($given + " " + $sur) `
    -UserPrincipalName (($sur + "@" + "$env:userdnsdomain")).ToLower() `
    -SamAccountName $sur.ToLower() `
    -AccountPassword (ConvertTo-SecureString -AsPlainText "$pass" -Force) `
    -Enabled $true `
    -ChangePasswordAtLogon $true `
    -Verbose
}
