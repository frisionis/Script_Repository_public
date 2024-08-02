<# This script uses ZIP to compress multiple (sub)folders 
and saves them individually in separate zip files.
#>

# Specify source folder
$source = 'C:\Jahre'

# Specify zip file location folder (destination folder, make sure it exists)
$destination = 'C:\ZipFiles'

# Action
$subfolders = Get-ChildItem $source -Directory -Recurse
foreach ($s in $subfolders) {
    $folderpath = $s.FullName
    $foldername = $s.Name
    Compress-Archive -Path $folderpath -DestinationPath $destination\$foldername
}

