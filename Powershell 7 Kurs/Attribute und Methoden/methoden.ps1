﻿### Methoden mit PowerShell

Get-Service | Get-Member
Get-Service | Get-Member -MemberType Method # genauer

(Get-Service spooler).Stop()

Stop-Service spooler # so geht es auch ...

### Methoden mit PowerShell aufrufen (Code).Methode

$player = New-Object System.Media.SoundPlayer "$env:windir\Media\windows logon.wav"
$player | Get-Member
$player.
$player.PlayLooping() # Methode tu etwas ==> Looping
Start-Sleep 10
$player.Stop() # Methode ==> Stop

### Methoden mit .NET Klassen aufrufen (wird nicht so häufig verwendet)

[System.Console]::Write('Hallo')
[System.Console]::

[System.Console]::Beep(200,1000)
[System.Console]::Beep(600,1000)

[System.Media.SystemSounds]::Exclamation.Play()
[System.Media.SystemSounds]::Hand.Play()

[math]::Ceiling('123.50')
[math]::

[System.Environment]::Exit(0)

https://sid-500.com/2018/03/07/do-speak-start-talking-with-remote-computers-system-speech/



