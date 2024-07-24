### Encryption with User SID

# Plain-Text Password
$password = '1234user!' 
# OR
$ask = Read-Host 'Enter-Password' -AsSecureString

# Converting in Secure-String
$password = ConvertTo-SecureString -String $password -AsPlainText -Force
# What kind of Object it is
$password
$password -is [System.Security.SecureString]
# Showing encrypted String
$password | ConvertFrom-SecureString

### Caveat: (Only) The user can decrypt the secure string !
ConvertFrom-SecureString -SecureString $password -AsPlainText # funktioniert nur in PS7

### Note: You cannot save a Secure String in a file 

