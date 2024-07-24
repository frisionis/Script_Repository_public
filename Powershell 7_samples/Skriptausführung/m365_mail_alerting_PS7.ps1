###  PowerShell 7 ONLY ! Ping result differs from PS 5!

### Retrieve all enabled Server by name

$servers = (Get-ADComputer -Properties operatingsystem `
 -Filter 'operatingsystem -like "*server*" -and enabled -eq "true"').Name

### Ping all Server

$sendaccount = 'alert@domain.com'
$password = '123#password'
$destaccount = 'pg@domain.com'

foreach ($item in $servers) {
        $Test = Test-Connection $item -Count 1
       
   If ($Test.Status -eq 'TimedOut' -or $Test.Status -like '*Destination*')
        {
        $date = Get-Date -Format 'dd-MM-yyyy HH:mm'
        $passw = $password | ConvertTo-SecureString -AsPlainText -Force
        $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $sendaccount, $passw
        $subject = "Alert: $item on $date down"
        $body = "Reporting server: $env:computername.Trying again in 15 minutes."
        
        ### Splatting with Hash Table
        $hash = @{
        
        To = $destaccount
        From = $sendaccount 
        Subject = $subject
        Body = $body 
        BodyAsHtml = $true 
        SmtpServer = 'smtp.office365.com' 
        UseSSL = $true
        Credential = $cred 
        Port = 587
        
        }
        
        ### Send Mail if server is down
        
        Send-MailMessage @hash -WarningAction Ignore
     }
    }