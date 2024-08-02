#############################################################################################################
#
#      Imaging Windows 11
#      Stand: 20.03.2023
#      Release: 22H2
#      Updates: M�rz 2023
#      
#      Hinweis:
#      Pfad Image: E:\Design\Win11\_vnext_wim_230320\
#      Pfad Mount: E:\Design\Win11\_vnext_mount_22H2\
#
#
#############################################################################################################



#Pr�fen welche Index in dem wIm enthalten sind
DISM.exe /Get-ImageInfo /imagefile:"E:\Design\Win11\_vnext_wim_230320\install.wim"

#Image Mounten ab 1709! Vorher immer Index:1 verwenden:
DISM.exe /Mount-Image /ImageFile:"E:\Design\Win11\_vnext_wim_230320\install.wim" /Index:3 /MountDir:"E:\Design\Win11\_vnext_mount_22H2"


# Dot.Net installieren
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:"E:\Design\Win11\_vnext_wim_230320\SXS"




# Nur f�r Sammlung der Daten notwendig.
DISM /image:"E:\Design\Win11\_vnext_mount_22H2" /get-features /format:table 
DISM /image:"E:\Design\Win11\_vnext_mount_22H2" /Get-Capabilities /format:table 

# Application Guard wird im Default seit 12/2018 nicht mehr aktiviert.
Dism.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2Root
Dism.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2
Dism.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Disable-Feature /FeatureName:Printing-XPSServices-Features
Dism.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Enable-Feature /FeatureName:TelnetClient
########## NEU 20.03.2023 ########## 
Dism.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client
Dism.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Enable-Feature /FeatureName:Windows-Defender-ApplicationGuard

# Alle Updates installieren
# vorher das aktuelle Update Paket in F:\_vnext_wim\Updates ablegen.
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /add-package /packagepath:E:\Design\Win11\_vnext_wim_230320\Updates


#Default Layout hinterlegen
########## NEU 20.03.2023 ########## 
copy E:\Design\Win11\_vnext_wim_230320\LayoutModification.json E:\Design\Win11\_vnext_mount_22H2\Users\Default\AppData\Local\Microsoft\Windows\Shell\


# Einbinden der Registry, damit direkte Anpassungen im Image vorgenommen werden können.
reg load HKLM\WimRegistry E:\Design\Win11\_vnext_mount_22H2\windows\system32\config\software

#Anpassen das keine Auto Apps installiert werden k�nnen.
#Nicht mehr aktiv seit 1909!
New-Item -Path HKLM:\WimRegistry\Policies\Microsoft -Name WindowsStore
New-Item -Path HKLM:\WimRegistry\Policies\Microsoft\WindowsStore -Name WindowsUpdate
New-ItemProperty -Path HKLM:\WimRegistry\Policies\Microsoft\WindowsStore\WindowsUpdate\ -name "AutoDownload" -Value "00000002"  -PropertyType DWORD -Force 
#App Vorschl�ge im Startmen� verhindern und Abschalten der Kontaktleiste in der Taskbar.
New-Item -Path HKLM:\WimRegistry\Policies\Microsoft\Windows -Name CloudContent
New-ItemProperty -Path HKLM:\WimRegistry\Policies\Microsoft\Windows\CloudContent\ -name "DisableWindowsConsumerFeatures" -Value "00000001"  -PropertyType DWORD -Force

########## NEU 20.03.2023 ########## 
# Feeds abschalten. Neu in 21H2
New-Item -Path HKLM:\WimRegistry\Policies\Microsoft\Windows -Name "Windows Feeds"
New-ItemProperty -Path "HKLM:\WimRegistry\Policies\Microsoft\Windows\Windows Feeds\" -name "EnableFeeds" -Value "00000000"  -PropertyType DWORD -Force


#Telemetrie Level auf „0-No Data“ setzen
New-ItemProperty -Path HKLM:\WimRegistry\Microsoft\Windows\CurrentVersion\Policies\DataCollection\ -name "AllowTelemetry" -Value "00000000" -PropertyType DWORD -Force

sleep 5
reg unload HKLM\WimRegistry


reg load HKLM\WimRegistry E:\Design\Win11\_vnext_mount_22H2\windows\system32\config\system
# Anzeigen, wann der Bildschirm beim Sperren ausgeschaltet wird.
New-ItemProperty -Path HKLM:\WimRegistry\ControlSet001\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7\ -name "Attributes" -Value "00000002"  -PropertyType DWORD -Force 
# Einstellungen für Thunderbolt vornehmen.
New-Item -Path HKLM:\WimRegistry\ControlSet001\Services -Name ThunderboltService
New-Item -Path HKLM:\WimRegistry\ControlSet001\Services\ThunderboltService -Name TbtServiceSettings
New-ItemProperty -Path HKLM:\WimRegistry\ControlSet001\Services\ThunderboltService\TbtServiceSettings -name "ApprovalLevel" -Value "00000001"  -PropertyType DWORD -Force 

#NEU 1909_2 und 20H2 Telemetrie Einstellungen
#ETW-Sessions deaktivieren
New-Item -Path HKLM:\WimRegistry\ControlSet001\Control\WMI\Autologger -Name AutoLogger-DiagTrack-Listener
Set-ItemProperty -Path HKLM:\WimRegistry\ControlSet001\Control\WMI\Autologger\AutoLogger-DiagTrack-Listener\ -name "Start" -Value "00000004"
#Telemetriedienst deaktivieren
Set-ItemProperty -Path HKLM:\WimRegistry\ControlSet001\Services\DiagTrack\ -name "Start" -Value "00000000"


# Bypass der Hardware Checks f�r Windows 11
########## NEU 20.03.2023 ########## 
#New-Item -Path HKLM:\WimRegistry\Setup -Name LabConfig
#New-ItemProperty -Path HKLM:\WimRegistry\Setup\LabConfig -name "BypassTPMCheck" -Value "00000001"  -PropertyType DWORD -Force 
#New-ItemProperty -Path HKLM:\WimRegistry\Setup\LabConfig -name "BypassSecureBootCheck" -Value "00000001"  -PropertyType DWORD -Force 
#New-ItemProperty -Path HKLM:\WimRegistry\Setup\LabConfig -name "BypassRAMCheck" -Value "00000001"  -PropertyType DWORD -Force 
#New-ItemProperty -Path HKLM:\WimRegistry\Setup\LabConfig -name "BypassStorageCheck" -Value "00000001"  -PropertyType DWORD -Force 
#New-ItemProperty -Path HKLM:\WimRegistry\Setup\LabConfig -name "BypassCPUCheck" -Value "00000001"  -PropertyType DWORD -Force 

#New-Item -Path HKLM:\WimRegistry\Setup -Name MoSetup
#New-ItemProperty -Path HKLM:\WimRegistry\Setup\MoSetup -name "AllowUpgradesWithUnsupportedTPMOrCPU" -Value "00000001"  -PropertyType DWORD -Force 

sleep 5
reg unload HKLM\WimRegistry



#Aktuelle ProvisionedAppxPackage bekommen
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Get-ProvisionedAppxPackages  | Format-Table -AutoSize
# Alle Eintr�ge aus dem Output in Excel kopieren, dann Abschnitte mit
# PackageName: xxx in Notepad kopieren und den Wert "PackageName:" durch 
# "DISM.exe /image:"D:\_vNext_Win10_22H2_Win11" /Remove-ProvisionedAppxPackage /PackageName:" ersetzen.
# Die Liste kann dann im folgenden Abschnitt eingef�gt werden.
# Die Anwendungen, die noch ben�tigt werden, m�ssen durch ein f�hrendes # auskommentiert werden.

# Folgende Apps bitte nie entfernen
# DesktopAppInstaller
# WindowsStore





# Apps L�schen, die nicht ben�tigt werden
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Clipchamp.Clipchamp_2.2.8.0_neutral_~_yxz26nhyzhsrt
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.549981C3F5F10_3.2204.14815.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingNews_4.2.27001.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.BingWeather_4.53.33420.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.DesktopAppInstaller_2022.310.2333.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GamingApp_2021.427.138.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.GetHelp_10.2201.421.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Getstarted_2021.2204.1.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.HEIFImageExtension_1.0.43012.0_x64__8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.HEVCVideoExtension_1.0.50361.0_x64__8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftOfficeHub_18.2204.1141.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftSolitaireCollection_4.12.3171.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.MicrosoftStickyNotes_4.2.2.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Paint_11.2201.22.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.People_2020.901.1724.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.PowerAutomateDesktop_10.0.3735.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.RawImageExtension_2.1.30391.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ScreenSketch_2022.2201.12.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.SecHealthUI_1000.22621.1.0_x64__8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.StorePurchaseApp_12008.1001.113.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Todos_2.54.42772.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.VCLibs.140.00_14.0.30704.0_x64__8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.VP9VideoExtensions_1.0.50901.0_x64__8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WebMediaExtensions_1.0.42192.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WebpImageExtension_1.0.42351.0_x64__8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Windows.Photos_21.21030.25003.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsAlarms_2022.2202.24.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsCalculator_2020.2103.8.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsCamera_2022.2201.4.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:microsoft.windowscommunicationsapps_16005.14326.20544.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsFeedbackHub_2022.106.2230.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2022.2202.6.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsNotepad_11.2112.32.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsSoundRecorder_2021.2103.28.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsStore_22204.1400.4.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsTerminal_3001.12.10983.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.Xbox.TCUI_1.23.28004.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGameOverlay_1.47.2385.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_2.622.3232.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxIdentityProvider_12.50.6001.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxSpeechToTextOverlay_1.17.29001.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.YourPhone_1.22022.147.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneMusic_11.2202.46.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:Microsoft.ZuneVideo_2019.22020.10021.0_neutral_~_8wekyb3d8bbwe
DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:MicrosoftCorporationII.QuickAssist_2022.414.1758.0_neutral_~_8wekyb3d8bbwe
#DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Remove-ProvisionedAppxPackage /PackageName:MicrosoftWindows.Client.WebExperience_421.20070.195.0_neutral_~_cw5n1h2txyewy



DISM.exe /image:"E:\Design\Win11\_vnext_mount_22H2" /Optimize-ProvisionedAppxPackages

# Zum �bernehmen der �nderungen ein Commit durchf�hren.
DISM.exe /Commit-Image /MountDir:"E:\Design\Win11\_vnext_mount_22H2"

# Anschlie�end das Mountverzeichnis verwerfen und die MountPoints bereinigen. 
DISM.exe /Unmount-Image /MountDir:"E:\Design\Win11\_vnext_mount_22H2" /discard
DISM.exe /Cleanup-Mountpoints

# Damit nur die Enterprise Version bleibt, alte Daten entfernt werden (ersetzt durch Updates und gel�schte Apps)
# ist ein Export notwendig. Ab 1709 immer Index:3 f�r Enterprise verwenden! Vorher immer Index:1 verwenden.
DISM.exe /export-Image /SourceImageFile:"E:\Design\Win11\_vnext_wim_230320\install.wim" /SourceIndex:3 /DestinationImageFile:"E:\Design\Win11\_vnext_wim_230320\install_New.wim"

# zum �berpr�fen 
Dism /Get-ImageInfo /imagefile:"E:\Design\Win11\_vnext_wim_230320\install_New.wim"