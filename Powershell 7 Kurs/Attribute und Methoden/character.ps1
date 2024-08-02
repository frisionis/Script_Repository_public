[char]0x263a
[char]0x278A

# Showing Unicode 16-bit character

for ($i=0; $i -lt 15000;$i++) {

    "Char $i : $([char]$i)"
     
 }

[char]::ConvertFromUtf32(0x1F4A9)
[char]::ConvertFromUtf32(0x1F601)
[char]::ConvertFromUtf32(0x1F602)

msg * "Grins $([char]::ConvertFromUtf32(0x1F601))"