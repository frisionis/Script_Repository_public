# PSStyle (nur ab PowerShell 7.2)
$PSStyle
$PSStyle.BlinkOff
$PSStyle.Underline

$msg = "Could not find part of path: {0}{1}{2}{3}" -f $psstyle.Italic,$psstyle.Background.Cyan,"c:\work",$psstyle.Reset
Write-Warning $msg

# https://4sysops.com/archives/using-powershell-with-psstyle/