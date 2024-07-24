### Create a certificate
$hash1 = @{
DnsName = 'test'
CertStoreLocation = 'Cert:\CurrentUser\my'
KeyUsage = 'KeyEncipherment', 'DataEncipherment', 'KeyAgreement'
Type = 'DocumentEncryptionCert'
}

New-SelfSignedCertificate @hash1

### Encrypt the password string with the newly created certifcate 
"123user!" | Protect-CmsMessage -To cn=test -OutFile $home\pwd.txt

### How does the file looks like?
Start-Process $home\pwd.txt

### Finally ... How do you know the password can be decrypted?
Unprotect-CmsMessage -Path $home\pwd.txt

### How to implement that in scripts? Example: Send an e-mail via Microsoft365 ...
$username = 'alert@domain.com'
$password = ConvertTo-SecureString (Unprotect-CmsMessage -Path $home\pwd.txt) -AsPlainText –Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
        
Send-MailMessage -Credential $cred `
-From alert@domain.com `
-To user@domain.com `
-Body "Test Message with encrypted credentials" `
-Subject "Test-Mail from Alert" `
-SmtpServer 'smtp.office365.com' `
-UseSsl `
-Port 587 `
-BodyAsHtml `
-WarningAction SilentlyContinue