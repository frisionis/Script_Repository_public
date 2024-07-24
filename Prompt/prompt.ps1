Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Hallo Holger hier musst du anpassen'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $x
}




#hier das Drop down

# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
# Create a new form
$Form1 = New-Object system.Windows.Forms.Form
# Define the size, title and background color
$Form1.ClientSize = ‘300,250’
$Form1.text = “PowerShell GUI Example”
$Form1.BackColor = “#ffffff”
$List = New-Object system.Windows.Forms.ComboBox
$List.text = “”
$List.width = 170
$List.autosize = $true
# Add the items in the dropdown list
@(‘Holger’,’Daniel’,’Michael’) | ForEach-Object {[void] $List.Items.Add($_)}
# Select the default value
$List.SelectedIndex = 0
$List.location = New-Object System.Drawing.Point(70,100)
$List.Font = ‘Microsoft Sans Serif,10’



$Form1.Controls.Add($List)

# Display the form
[void]$Form1.ShowDialog() 
