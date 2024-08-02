<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Arrays</title>

    <style type="text/css">
        body {
            font-size: 20px;
            font-family: Verdana, sans-serif;
        } 
        li {
            list-style: none;
        }           
    </style>       
</head>
<body>
<?php

/* =================================================================

    Numerisch indizierte Arrays

=================================================================== */
// $einkauf = [];

// $einkauf[0] = "Nutella";
// $einkauf[1] = "Cola";
// $einkauf[2] = "Kiwis";
// $einkauf[3] = "Bananen";

// $einkauf = ["Nutella", "Cola", "Kiwis", "Bananen"];

// echo $einkauf[2];

// echo "<br>";

// $einkauf[] = "Chips";

// echo $einkauf[4];

// echo "<br>";

// $einkauf[0] = "Ahornsirup";

// echo $einkauf[0];

// echo "<br>";

/*--- Array-Element(e) am Ende des Arrays hinzufügen */
// array_push($einkauf, "Brötchen", "Marmelade");
// print_r($einkauf);

/*--- Array-Element(e) am Anfang des Arrays hinzufügen */
// array_unshift($einkauf, "Kaffee", "Honig");
// print_r($einkauf);

/*--- Array-Element am Ende des Arrays entfernen */
// array_pop($einkauf);
// print_r($einkauf);

/*--- Array-Element am Anfang des Arrays entfernen */
// array_shift($einkauf);
// print_r($einkauf);

/*--- Array-Element(e) ab einer bestimmten Position im Array entfernen */
// array_splice($einkauf, 1);
// print_r($einkauf);

/*--- Array-Element(e) ab einer bestimmten Position im Array einfügen, die "0" an der dritten Position bedeutet, dass kein Element entfernt wird */
// array_splice($einkauf, 1, 0, ["Apfel", "Kirsche"]);
// print_r($einkauf);

/*--- Array-Element(e) ab einer bestimmten Position im Array einfügen, die "2" an der dritten Position bedeutet, dass zwei Element entfernt werden */
array_splice($einkauf, 1, 2, ["Apfel", "Kirsche"]);
print_r($einkauf);

/* === Element vom Ende des Arrays entfernen === */
// $elemente = array_splice($einkauf, -2);
// print_r($elemente);
// print_r($einkauf);

/* === Array Elemente aufsteigend sortieren === */
// print_r($einkauf);
// echo "<br>";
// sort($einkauf);
// print_r($einkauf);

/* === Array Elemente absteigend sortieren === */
// print_r($einkauf);
// echo "<br>";
// rsort($einkauf);
// print_r($einkauf);

// $zahlen = [12,9,22,3,15];

// print_r($zahlen);
// echo "<br>";
// rsort($zahlen);
// print_r($zahlen);

/* === Array erzeugen mit Sprachkonstrukt array() === */

// $arrLinks = array(
//     'http://www.google.de',
//     'http://www.freenet.de',
//     'http://www.facebook.de',
//     'http://www.laut.de',
// );

// var_dump($arrLinks);

// echo "<ul>";

// foreach($arrLinks as $link)  {
//     echo "<li><a href=\"" . $link . "\">". $link . "</a></li>";
// }

// echo"</ul>";

/* === Array erzeugen mit eckigen Klammern (seit PHP 5.4 möglich) === */

// $arrTemperaturen = [10, 12, 15, 14, 16, 17, 20];

// for ($i = 0; $i < count($arrTemperaturen); $i++) {
//     echo "Temperatur: " . $arrTemperaturen[$i] . "<br>";
// }

/* =================================================================

    Assoziative Arrays

=================================================================== */
// $arrTemperaturen = [
//     "Montag" => 10, 
//     "Dienstag" => 12, 
//     "Mittwoch" => 15, 
//     "Donnerstag" => 14, 
//     "Freitag" => 16, 
//     "Samstag" => 17, 
//     "Sonntag" => 20
// ];

// $arrTemperaturen['Montag'] = 30;
// echo $arrTemperaturen['Montag'];

// print_r($arrTemperaturen);
// echo "<br>";

/* === Assoziatives Array nach den Schlüsseln sortieren === */
// ksort($arrTemperaturen);
// print_r($arrTemperaturen);
// echo "<br>";

/* === Assoziatives Array nach den Werten sortieren === */
// asort($arrTemperaturen);
// print_r($arrTemperaturen);

// $arrLinks = array(
//     'Google' 	=> 'http://www.google.de',
//     'Freenet'	=> 'http://www.freenet.de',
//     'Facebook'	=> 'http://www.facebook.de',
//     'Laut' 	    => 'http://www.laut.de',
// );

// echo "<ul>";

// foreach($arrLinks as $schluessel => $wert)  {
//     echo "<li><a href=\"" . $wert . "\">". $schluessel . "</a></li>";
// }

// echo"</ul>";

// $arrTemperaturen = [
//     "Montag" => 10, 
//     "Dienstag" => 12, 
//     "Mittwoch" => 15, 
//     "Donnerstag" => 14, 
//     "Freitag" => 16, 
//     "Samstag" => 17, 
//     "Sonntag" => 20
// ];

// foreach ($arrTemperaturen as $wochentag => $temperatur) {
//     echo "Wochentag: <b>" . $wochentag . "</b> Temperatur: <b>" . $temperatur . "</b><br>";
// }

/* =================================================================

    Mehrdimensionale Arrays

=================================================================== */

// $arrTemp = [
//     [11, 12, 17, 20, 21, 23],
//     [8, 13, 15, 21, 22, 24],
//     [9, 13, 16, 18, 21, 20]
// ];

// Gibt den Wert 21 aus
// echo $arrTemp[2][4];

/* === Verschachtelte for-Schleife === */
// for ($i = 0; $i < count($arrTemp); $i++) {

//     echo "<h4>Äußeres Array Index: " . $i . "</h4>";
 
//     for ($j = 0; $j < count($arrTemp[$i]); $j++) {
//        echo "<p>Wert von <b>Index " . $j . "</b> im inneren Array: <b>" . $arrTemp[$i][$j]  . "</b></p>";
//     }

//     echo "<hr>";
// }

/* === Verschachtelte foreach-Schleife === */
// foreach($arrTemp as $index => $arrTempInnen) {
//     echo $index;
//     foreach($arrTempInnen as $tempInnenEinzeln) {
//         echo "<h5>" . $tempInnenEinzeln . "</h5>";
//     }

//     echo "<hr>";
// }

// $arrTemperaturen = [
//     "KW09" => [
//         "Montag" => 10, 
//         "Dienstag" => 12, 
//         "Mittwoch" => 15, 
//         "Donnerstag" => 14, 
//         "Freitag" => 16, 
//         "Samstag" => 17, 
//         "Sonntag" => 20
//     ],
//     "KW10" => [
//         "Montag" => 10, 
//         "Dienstag" => 12, 
//         "Mittwoch" => 15, 
//         "Donnerstag" => 14, 
//         "Freitag" => 16, 
//         "Samstag" => 17, 
//         "Sonntag" => 20
//     ],
//     "KW11" => [
//         "Montag" => 9, 
//         "Dienstag" => 12, 
//         "Mittwoch" => 7, 
//         "Donnerstag" => 9, 
//         "Freitag" => 13, 
//         "Samstag" => 10, 
//         "Sonntag" => 15
//     ]
// ];

// foreach ($arrTemperaturen as $kalenderwoche => $arrTemperaturenKalenderwoche) {
//     echo "<h4>" . $kalenderwoche . "</h4>";
//     foreach ($arrTemperaturenKalenderwoche as $wochentag => $tempEinzeln) {
//         echo "<p>" . $wochentag . ": " . $tempEinzeln . "</p>";
//     }
//     echo "<hr>";
// }

?>    
</body>
</html>