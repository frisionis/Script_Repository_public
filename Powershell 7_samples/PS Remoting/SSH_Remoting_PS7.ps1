# Install OpenSSH Client and Server
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Initial Configuration of SSH Server
Start-Service sshd -Verbose
Set-Service -Name sshd -StartupType 'Automatic' -Verbose

# Enable SSH Remoting
Install-Module -Name Microsoft.PowerShell.RemotingTools -Force -AllowClobber -Verbose
Enable-SSHRemoting 
Restart-Service sshd -Verbose

# Establish SSH Session to Remote-Computer

Enter-PSSession -HostName cl01 -UserName administrator     # -HostName instead of -ComputerName will enable SSH Transport
