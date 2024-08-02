function Get-MsiVersion {
    param (
        [IO.FileInfo] $FilePath
    )

    try {
        $windowsInstaller = New-Object -com WindowsInstaller.Installer

        $database = $windowsInstaller.GetType().InvokeMember(
                "OpenDatabase", "InvokeMethod", $Null, 
                $windowsInstaller, @($FilePath.FullName, 0)
            )

        $q = "SELECT Value FROM Property WHERE Property = 'ProductVersion'"
        $View = $database.GetType().InvokeMember(
                "OpenView", "InvokeMethod", $Null, $database, ($q)
            )

        $View.GetType().InvokeMember("Execute", "InvokeMethod", $Null, $View, $Null)

        $record = $View.GetType().InvokeMember(
                "Fetch", "InvokeMethod", $Null, $View, $Null
            )

        $global:productVersion = $record.GetType().InvokeMember(
                "StringData", "GetProperty", $Null, $record, 1
            )

    } catch {
        throw "Failed to get MSI file version the error was: {0}." -f $_
    }
}

function Get-MsiProductCode {
    param (
        [IO.FileInfo] $FilePath
    )

    try {
        $windowsInstaller = New-Object -com WindowsInstaller.Installer

        $database = $windowsInstaller.GetType().InvokeMember(
                "OpenDatabase", "InvokeMethod", $Null, 
                $windowsInstaller, @($FilePath.FullName, 0)
            )

        $q = "SELECT Value FROM Property WHERE Property = 'ProductCode'"
        $View = $database.GetType().InvokeMember(
                "OpenView", "InvokeMethod", $Null, $database, ($q)
            )

        $View.GetType().InvokeMember("Execute", "InvokeMethod", $Null, $View, $Null)

        $record = $View.GetType().InvokeMember(
                "Fetch", "InvokeMethod", $Null, $View, $Null
            )

        $global:ProductCode = $record.GetType().InvokeMember(
                "StringData", "GetProperty", $Null, $record, 1
            )

    } catch {
        throw "Failed to get MSI file version the error was: {0}." -f $_
    }
}

function convert1 {
	param (
		$codeID,
		$i)
	$global:convert1 = ""

	do {
		$code = $codeID.Substring($i,1)
		$global:convert1 = $global:convert1 + $code
		$i = $i - 1
		}
	while ($i -ne -1)
	return $global:convert1
}

function convert2 {
	param (
		$codeID,
		$i)
	$c = 0
	$global:convert2 = ""
	do {
		$code1 = $codeID.Substring($c,1)
		$c++
		$code2 = $codeID.Substring($c,1)

		$global:convert2 = $global:convert2 + $code2 + $code1
		$c++
		}
	while ($c -ne $i)
	return $global:convert2
}

Function Get-FileName($initialDirectory)
{   
 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.ShowHelp = $True
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = "All files (*.msi)| *.msi"
# $OpenFileDialog.filter = "All files (*.*)| *.*"
 $OpenFileDialog.ShowDialog() | Out-Null
 $global:msifile = $OpenFileDialog.filename
} #end function Get-FileName
#######################################################################################################################

#-----GUI-------------------------------------------------------------------
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "MSI Info Tool"
$objForm.Size = New-Object System.Drawing.Size(600,240) 
$objForm.StartPosition = "CenterScreen"

$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})


$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Size(485,170)
$CancelButton.Size = New-Object System.Drawing.Size(80,23)
$CancelButton.Text = "Cancel"
$CancelButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancelButton)


$OpenButton = New-Object System.Windows.Forms.Button
$OpenButton.Location = New-Object System.Drawing.Size(10,20)
$OpenButton.Size = New-Object System.Drawing.Size(120,23)
$OpenButton.Text = "MSI Datei auswaehlen"
$OpenButton.Add_Click({
	Get-FileName -initialDirectory "c:\"

	If ($global:msifile) {
		$objTextBox1.Text = $global:msifile

		Get-MsiVersion $global:msifile
		Get-MsiProductCode $global:msifile

		$global:MSIInstallerID = $global:productCode.replace("{","")
		$global:MSIInstallerID = $global:MSIInstallerID.replace("}","")
		$global:MSIInstallerID_split = $global:MSIInstallerID.split("-")

		$block0 = convert1 $global:MSIInstallerID_split[0] 7
		$block1 = convert1 $global:MSIInstallerID_split[1] 3
		$block2 = convert1 $global:MSIInstallerID_split[2] 3
		$block3 = convert2 $global:MSIInstallerID_split[3] 4
		$block4 = convert2 $global:MSIInstallerID_split[4] 12

		$global:MSIInstallerID = $block0 + $block1 + $block2 + $block3 + $block4

		$objTextBox3.Text = $global:productVersion
		$objTextBox4.Text = $global:productCode
		$objTextBox5.Text = $global:MSIInstallerID

		$objForm.Update()
		}
	Else{
		[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
		[Windows.Forms.MessageBox]::Show("Es wurde keine Datei ausgewaehlt!", "Error", [Windows.Forms.MessageBoxButtons]::OK, [Windows.Forms.MessageBoxIcon]::Information)
		}
	})
$objForm.Controls.Add($OpenButton)

$objTextBox1 = New-Object System.Windows.Forms.TextBox 
$objTextBox1.Location = New-Object System.Drawing.Size(140,22) 
$objTextBox1.Size = New-Object System.Drawing.Size(400,20)
$objTextBox1.Text = "MSI Datei auswaehlen"
$objForm.Controls.Add($objTextBox1)

$objForm.Controls.Add($InfoButton)


$objLabel2 = New-Object System.Windows.Forms.Label
$objLabel2.Location = New-Object System.Drawing.Size(10,90) 
$objLabel2.Size = New-Object System.Drawing.Size(120,20) 
$FontBold = new-object System.Drawing.Font("Arial",8,[Drawing.FontStyle]'Bold' )
$objLabel2.Font = $fontBold
$objLabel2.Text = "MSI Info"
$objForm.Controls.Add($objLabel2) 


$objLabel3 = New-Object System.Windows.Forms.Label
$objLabel3.Location = New-Object System.Drawing.Size(10,110)
$objLabel3.Size = New-Object System.Drawing.Size(160,20) 
$objLabel3.Text = "MSI Version: "
$objForm.Controls.Add($objLabel3)

$objTextBox3 = New-Object System.Windows.Forms.TextBox 
$objTextBox3.Location = New-Object System.Drawing.Size(170,110) 
$objTextBox3.Size = New-Object System.Drawing.Size(250,20) 
$objForm.Controls.Add($objTextBox3)

$objLabel4 = New-Object System.Windows.Forms.Label
$objLabel4.Location = New-Object System.Drawing.Size(10,135)
$objLabel4.Size = New-Object System.Drawing.Size(160,20) 
$objLabel4.Text = "MSI ProductCode: "
$objForm.Controls.Add($objLabel4)

$objTextBox4 = New-Object System.Windows.Forms.TextBox 
$objTextBox4.Location = New-Object System.Drawing.Size(170,135) 
$objTextBox4.Size = New-Object System.Drawing.Size(250,20) 
$objForm.Controls.Add($objTextBox4) 

$objLabel5 = New-Object System.Windows.Forms.Label
$objLabel5.Location = New-Object System.Drawing.Size(10,160)
$objLabel5.Size = New-Object System.Drawing.Size(160,20) 
$objLabel5.Text = "MSIInstallerID: "
$objForm.Controls.Add($objLabel5)

$objTextBox5 = New-Object System.Windows.Forms.TextBox 
$objTextBox5.Location = New-Object System.Drawing.Size(170,160) 
$objTextBox5.Size = New-Object System.Drawing.Size(250,20) 
$objForm.Controls.Add($objTextBox5) 

$objForm.Topmost = $True

$objForm.Add_Shown({$objForm.Activate()})
[void] $objForm.ShowDialog()