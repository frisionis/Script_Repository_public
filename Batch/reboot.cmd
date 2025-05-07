REM Neustartscript 

REM Als erstes die DCs

shutdown -m \\BKKDC011 -r -f -t 1

\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 240
shutdown -m \\BKKDC012 -r -f -t 1

\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 240

shutdown -m \\BKKDC013 -r -f -t 1

\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 220

REM Dann die restlichen DCs

shutdown -m \\BKKDC203 -r -f -t 1




\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 240


\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 120

REM Nun die erste Hälfte der Infrastrukturserver
shutdown -m \\SVWCTXNPS001P -r -f -t 1
rem shutdown -m \\VMKKWCTXNPS01 -r -f -t 1
shutdown -m \\BKKDW005 -r -f -t 1
shutdown -m \\BKKDW006 -r -f -t 1
shutdown -m \\BKKPROLINT002 -r -f -t 1
rem shutdown -m \\BKKVMMNODE001 -r -f -t 1
rem shutdown -m \\BKKCTXPVS003 -r -f -t 1
rem shutdown -m \\BKKMOBILUS001 -r -f -t 1
rem shutdown -m \\BKKDHCP001 -r -f -t 1
rem shutdown -m \\BKKTKWEB002 -r -f -t 1
shutdown -m \\BKKPAMARC001 -r -f -t 1
shutdown -m \\BKKLYNC001 -r -f -t 1
shutdown -m \\BKKGERMOBXO001 -r -f -t 1
shutdown -m \\BKKGERMOBXP001 -r -f -t 1
shutdown -m \\BKKXDESKTOP002 -r -f -t 1
shutdown -m \\BKKDEVTOOLS004 -r -f -t 1
rem shutdown -m \\BKKSPAPP001 -r -f -t 1
shutdown -m \\BKKKABRIDGE001 -r -f -t 1
shutdown -m \\BKKSPPWM001 -r -f -t 1
shutdown -m \\BKKSPPWM002 -r -f -t 1
shutdown -m \\BKKDEVOPS001 -r -f -t 1
shutdown -m \\BKKSPPWM003 -r -f -t 1
rem shutdown -m \\BKKDELLWDM001 -r -f -t 1
shutdown -m \\BKKRADIUS001 -r -f -t 1
shutdown -m \\SVWDGROUPER001P -r -f -t 1
\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 240

REM Und nun der Rest der Server ...
shutdown -m \\BKKPAMRET001 -r -f -t 1

\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 480
shutdown -m \\SVWCTXNPS002P -r -f -t 1
rem shutdown -m \\VMKKWCTXNPS01 -r -f -t 1
shutdown -m \\BKKDWTOOLS001 -r -f -t 1
rem shutdown -m \\BKKINFRA003 -r -f -t 1
shutdown -m \\BKKIVANTI001 -r -f -t 1
shutdown -m \\BKKSPTWM001 -r -f -t 1
shutdown -m \\BKKPROFORMAT001 -r -f -t 1
shutdown -m \\BKKRADIUS002 -r -f -t 1
shutdown -m \\BKKCUSTOMEXP001 -r -f -t 1
shutdown -m \\SVWSQLSTAGE001P -r -f -t 1
shutdown -m \\BKKXADOBE001 -r -f -t 1
shutdown -m \\BKKSAPVIEWER018 -r -f -t 1
shutdown -m \\BKKOPMTRACK001 -r -f -t 1
shutdown -m \\BKKSF003 -r -f -t 1
shutdown -m \\BKKSPQPHA002 -r -f -t 1
shutdown -m \\BKKARIS004 -r -f -t 1
shutdown -m \\BKKBPUB004 -r -f -t 1
shutdown -m \\BKKADAXES002 -r -f -t 1
rem shutdown -m \\BKKPEP002 -r -f -t 1
shutdown -m \\BKKVDILIZENZ001 -r -f -t 1
shutdown -m \\BKKVDILIZENZ002 -r -f -t 1
shutdown -m \\BKKXDESKTOP001 -r -f -t 1
shutdown -m \\BKKSFDEV003 -r -f -t 1
shutdown -m \\BKKAAUMSDB002 -r -f -t 1
shutdown -m \\BKKAAMACS001 -r -f -t 1
shutdown -m \\BKKTKWEB003 -r -f -t 1
shutdown -m \\SVWMGMT001P -r -f -t 1
rem shutdown -m \\BKKKMS001 -r -f -t 1
shutdown -m \\BKKAAD001 -r -f -t 1
shutdown -m \\BKKINFRA005 -r -f -t 1
shutdown -m \\BKKGERMOBXN001 -r -f -t 1
shutdown -m \\BKKAZS001 -r -f -t 1
shutdown -m \\BKKBEBPOGW001 -r -f -t 1
shutdown -m \\BKKDWTEST003 -r -f -t 1
shutdown -m \\BKKCTXSTORE003 -r -f -t 1
rem shutdown -m \\VMKKWCTXSTORE01 -r -f -t 1
shutdown -m \\SVWAAGENTS001T -r -f -t 1
shutdown -m \\SVWADEVOPS001T -r -f -t 1
shutdown -m \\BKKADMGMT001 -r -f -t 1
shutdown -m \\BKKADAXES001 -r -f -t 1
rem shutdown -m \\BKKVSCAN003 -r -f -t 1
shutdown -m \\BKKPROFORMA001 -r -f -t 1
shutdown -m \\BKKMAILOPT001 -r -f -t 1
shutdown -m \\BKKMSRAAS001 -r -f -t 1
shutdown -m \\BKKADMCENTER001 -r -f -t 1
shutdown -m \\BKKGERMOBXU001 -r -f -t 1
shutdown -m \\BKKSPPPHA001 -r -f -t 1
shutdown -m \\SVWKUBIMA001P -r -f -t 1
shutdown -m \\BKKSPQPHA001 -r -f -t 1
shutdown -m \\BKKSPPPHA002 -r -f -t 1
shutdown -m \\BKKSPTPHA001 -r -f -t 1
shutdown -m \\BKKSAPVIEWER013 -r -f -t 1
shutdown -m \\BKKSAPVIEWER014 -r -f -t 1
shutdown -m \\BKKSAPVIEWER015 -r -f -t 1
shutdown -m \\BKKSAPVIEWER016 -r -f -t 1
shutdown -m \\SVWCTXSTORE001T -r -f -t 1
shutdown -m \\BKKAAUMSSVC001 -r -f -t 1
shutdown -m \\BKKSAPVIEWER017 -r -f -t 1
shutdown -m \\BKKIMPORTER007 -r -f -t 1
shutdown -m \\BKKIMPORTER008 -r -f -t 1
shutdown -m \\BKKIMPORTER009 -r -f -t 1
shutdown -m \\BKKIMPORTER010 -r -f -t 1
shutdown -m \\BKKMOREEN004 -r -f -t 1
shutdown -m \\SVWPEP001P -r -f -t 1
shutdown -m \\SVWELASTIC001P -r -f -t 1
shutdown -m \\SVWELASTIC002P -r -f -t 1
shutdown -m \\SVWELASTIC003P -r -f -t 1
shutdown -m \\SVWKIBANA001P -r -f -t 1
shutdown -m \\BKKMOREEN005 -r -f -t 1
shutdown -m \\BKKMOREEN006 -r -f -t 1
shutdown -m \\BKKIVANTI002 -r -f -t 1
shutdown -m \\BKKIVANTI003 -r -f -t 1
shutdown -m \\BKKIVANTI004 -r -f -t 1
shutdown -m \\BKKIVANTI005 -r -f -t 1
shutdown -m \\BKKCTXDDC001 -r -f -t 1
rem shutdown -m \\VMKKWCTXDDC01 -r -f -t 1
shutdown -m \\BKKVDISTORE001 -r -f -t 1
rem shutdown -m \\BKKDHCP002 -r -f -t 1

\\bkkfiler01\software$\04-Tools\Admin-Skripte\sleep.exe 480

rem shutdown -m \\BKKVSCAN002 -r -f -t 1
shutdown -m \\BKKSFOCR003 -r -f -t 1
shutdown -m \\BKKSFOCR004 -r -f -t 1
shutdown -m \\BKKCTXDDC002 -r -f -t 1
rem shutdown -m \\VMKKWCTXDDC02 -r -f -t 1
shutdown -m \\BKKVDISTORE002 -r -f -t 1

shutdown -m \\BKKSFDEVOCR002 -r -f -t 1
shutdown -m \\BKKCTXSTORE004 -r -f -t 1
rem shutdown -m \\VMKKWCTXSTORE02 -r -f -t 1
shutdown -m \\SVWTCMGMT001T -r -f -t 1

pause
