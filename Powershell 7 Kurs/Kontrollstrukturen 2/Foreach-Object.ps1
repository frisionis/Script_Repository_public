# Foreach-Object 

$a = 5,8,9,11
$a | ForEach-Object {$_ + 5}

1..100 | ForEach-Object {
    New-Item -ItemType Directory -Name Schularbeit$_ `
    -Path $home
}