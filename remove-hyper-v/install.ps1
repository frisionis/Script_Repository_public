##
# Entfernen der Hyper-V Geräte
# Version 1 Michael Liebner
# Version 2 Konstantin Skubowius
# 2.1 Security.Principal.WindowsPrincipal
# 2.2 Logging
# 09.03.2021 
# Test der Schleife zum entfernen der Hyper-V Geräte


# $MyHostname = $env:computername

# $MYLogFile = "Install_"+"remove-hyper-v"+"_"+"1"+".log"
#        $MYLocalLogpath = "$env:WinDir\Logs\Software\$MYLogFile"

#try{

 #   if (-not([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
 
# $PSCommandPath | Out-File -FilePath  $MYLocalLogpath -Append -Force
 
 
    foreach ( $i in Get-Content ".\remove-hyper-v.txt") { 
        
      
                   
        
      C:\Windows\system32\pnputil.exe /remove-device $i
      # | Out-File -FilePath  $MYLocalLogpath -Append -Force
        #ls| Out-File -FilePath  $MYLocalLogpath -Append -Force
        
       # $i | Out-File -FilePath  $MYLocalLogpath -Append -Force
        Start-Sleep -Seconds 1
        } 


   # $MyLogPath = "\\VINWDW01\SCCMClient$\$MyHostname\$MYLogFile" 
    #copy-item $MYLocalLogpath $MyLogPath
  # write-host "Abgeschlossen" | Out-File -FilePath  $MYLocalLogpath -Append -Force
  # }
#catch {
 #   write-host "Fehler aufgefunden: `r`n $_.Exception.Message" | Out-File -FilePath  $MYLocalLogpath -Append -Force
#    }
 # finally {
 #  }

 exit
          
