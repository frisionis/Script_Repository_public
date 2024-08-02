# Import users from csv (format: name;sn;givenname;E-Mail Address;samAccountName;ParentOU)

# Provide password for all users
$pass = '1234user!'

Import-Csv "$home\Test.csv" -Delimiter ';' | 
ForEach-Object {
    New-ADUser -Name $_.Name `
    -GivenName $_.givenname `
    -Surname $_.sn `
    -Path $_."ParentOU" `
    -SamAccountName $_.samAccountName `
    -UserPrincipalName ($_.samAccountName + '@' + $env:userdnsdomain) `
    -AccountPassword (ConvertTo-SecureString "$pass" -AsPlainText -Force) `
    -EmailAddress $_."E-Mail Address" `
    -Enabled $true `
    -ChangePasswordAtLogon $true
}
