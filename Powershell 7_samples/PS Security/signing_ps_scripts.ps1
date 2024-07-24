# Signing PowerShell Scripts

# Create Certificate
New-SelfSignedCertificate -DnsName patrick@sid-500.com -CertStoreLocation Cert:\CurrentUser\My\ -Type Codesigning
certmgr.msc # Check and copy Certificate to Trusted Root and Trusted Publisher

# Create ps1 Test -FilePath
New-Item -ItemType File -Path $home\script1.ps1 -Value 'Write-Host "Test."' -Force

# Sign PS Script
Set-AuthenticodeSignature -FilePath $home\script1.ps1 -Certificate (Get-ChildItem -Path Cert:\CurrentUser\My\ -CodeSigningCert)
Get-AuthenticodeSignature -FilePath $home\script1.ps1 | Format-List 

# Testing
Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned
&$home\script1.ps1
