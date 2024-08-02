dism /get-imageinfo /imagefile:"\\VINWDW01.mis.net\SMS_dp$\OSD\Win11Enterprise_21H2\sources\install.wim"
dism /mount-image /imagefile:"\\VINWDW01.mis.net\SMS_dp$\OSD\Win11Enterprise_21H2\sources\install.wim" /index:1  /mountdir:"E:\_win11_mount"


dism /image:"E:\_win11_mount" /get-provisionedappxpackages

dism /image:"E:\_win11_mount" /remove-provisionedappxpackage /packagname:

dism /commit-image /mountdir:"E:\_win11_mount"

dism /unmount-image /mountdir:"E:\_win11_mount" /discard

reg load hklm\wimRegistry  E:\_win11_mount\windows\system32\config\software
# Für SCCM 
new-itemproperty -path HKLM:\wimRegistry\Microsoft\Windows\CurrentVersion\Communications\ -name "ConfigureChatAutoInstall" -Value "00000000" -Propertytype DWORD -force

reg unload hklm\wimRegistry

#remove-appxpackage -package "MicrosoftTeams_22183.300.1431.9295_x64__8wekyb3d8bbwe" -Allusers

