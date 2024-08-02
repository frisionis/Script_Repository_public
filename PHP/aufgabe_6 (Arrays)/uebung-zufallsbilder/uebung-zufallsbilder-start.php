<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Zufallsbilder | rand()</title>
    <style>
        img {
            max-width: 80%;
            height: auto;
        }
    </style>
</head>
<body>
<?php
$bilder = [
    'blumen.jpg',
    'boot.jpg',
    'hafen_seitenansicht.jpg',
    'hafen.jpg', 
    'landschaft.jpg',
    'meer.jpg',
    'parkplatz.jpg',
    'stadt_am_meer.jpg',
    'strand.jpg',
    'wiesen.jpg',
];
$ba = rand(0,count($bilder)-1);
?>
<img src="bilder/<?php print $bilder[$ba];?>">
</body>
</html>