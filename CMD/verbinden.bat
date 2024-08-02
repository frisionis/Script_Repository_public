net use g: /del
net use G: \\sr-ce-db01\daten /persistent:no

net use s: /del
net use S: \\sr-ce-db01\scan /persistent:no

net use z: /del
net use z: \\sr-ce-db01\user\%username% /persistent:no

net time \\sr-ce-dc01 /set /yes
