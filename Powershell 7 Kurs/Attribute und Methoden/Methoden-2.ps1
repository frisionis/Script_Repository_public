# String
'Patrick'.GetType()
'Patrick' | Get-Member

# Cmdlets
(Get-Process).GetType() # Array
(Get-Process explorer).GetType() # Prozess
Get-Process explorer | Get-Member

# AD User
(Get-ADUser -Identity administrator).GetType()
Get-ADUser -Identity administrator -Properties * | Get-Member
