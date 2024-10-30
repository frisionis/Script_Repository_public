'Heute ist der {0} und ich bin angemeldet als {1} und bin auf Computer {2} angemeldet.' -f (Get-Date), $env:username, $env:LOGONSERVER
"Heute ist der $(Get-Date) und ich bin angemeldet als $env:username und bin auf Computer $env:logonserver angemeldet." # Alernative

'{0:yyyy}' -f (Get-Date)

'{0:hh}:{0:mm}' -f (Get-Date)

'{0:n3}' -f 123.45678
#oder
[math]::Round(123.45678,3)

'{0:d4}' -f 1
'{1:d4}' -f 1,2

1..100 | ForEach-Object {'Server{0:d3}' -f $_}

"{0:###-##-##}" -f 8976203
"{0:###|##|##}" -f 8976203

'{0:C}' -f 199.99

'{0:p}' -f .703
'{0:p}' -f 1.4


