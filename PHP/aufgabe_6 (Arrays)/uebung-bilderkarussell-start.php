<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bilderkarussell</title>
    <style>
        img {
            width: 20%;
            height: auto;
        }
    </style>
</head>
<body>

<a href="uebung-bilderkarussell-start.php?richtung=zurueck">zurück</a>
<a href="uebung-bilderkarussell-start.php?richtung=vor">weiter</a>



<?php 

$arrbilder = [
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
$count = count($arrbilder);
if (isset($_COOKIE['pos'])) {
$pos = $_COOKIE['pos'];
if (isset($_GET['richtung'])) {
    switch (true) {
        case $_GET['richtung'] == "zurueck":
        $pos--;
        if ($pos <0) { $pos= 0;
        }
        break;
        case $_GET['richtung'] == "vor":
        $pos++;
        if ($pos >count($arrbilder) -1) { $pos = 0;
        }
        break;
        default: print "hääää?";
    }
}
print $pos;
}
else {
    $pos = 0;
}
setcookie('pos', $pos);

 ?>
 <br> <br>
 <img src="bilder/<?php echo $arrbilder[$pos];?>">
</body>
</html>