<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verzweigungen</title>

    <style type="text/css">
        body {
            font-size: 20px;
            font-family: Verdana, sans-serif;
        }            
    </style>       
</head>
<body>
<?php

/* === Vergleichsoperatoren === */

// $zahl = 6;

// if ( $zahl == 6 ) {
//     echo "Die Zahl ist gleich 6.<br>";
// } 

// if ( $zahl > 5 ) {
//     echo "Die Zahl ist größer als 5.<br>";        
// }

// if ( $zahl < 5 ) {
//     echo "Die Zahl ist kleiner als 5.<br>";
// }
 
// $vorname = "Homer";

// if ( $vorname == "Bart" ) {
//     echo "Ein doller Vorname: " . $vorname . "<br>";
// } else {
//     echo "Auch ein schöner Name: " . $vorname . "<br>";
// } 

// $vorname = "Homer";

// if ( $vorname == "Bart" ) {
//     echo "Ein doller Vorname: " . $vorname . "<br>";
// } else if ( $vorname == "Homer" ) {
//     echo "Auch ein schöner Name: " . $vorname . "<br>";
// } else {
//     echo "Es gibt viele schöne Namen." . "<br>";
// } 

// $vorname = "Homer";

// switch ( $vorname ) {
//     case "Bart": 
//         echo "Ein doller Vorname: " . $vorname . "<br>";  
//         break;
//     case "Homer": 
//         echo "Auch ein schöner Name: " . $vorname . "<br>";  
//         break;
//     default:
//         echo "Es gibt viele schöne Namen." . "<br>";
// }

// $vorname = "Bart";

// switch ( $vorname ) {
//     case "Bart": 
//     case "Homer": 
//         echo "Ein schöner Name: " . $vorname . "<br>";  
//         break;
//     case "Lisa": 
//         echo "Auch ein schöner Name: " . $vorname . "<br>";  
//         break;
//     default:
//         echo "Es gibt viele schöne Namen." . "<br>";
// }

// $zahl = 2;

// switch ( true ) {
//     case $zahl > 4: 
//         echo "Zahl ist größer als 4";  
//         break;
//     case $zahl < 4:  
//         echo "Zahl ist kleiner als 4";  
//         break;
//     default:
//         echo "Zahl ist gleich 4";
// }

/* === Logische Operatoren === */ 

// $zahl = 4;

// Nur 4
// if ( $zahl > 3 && $zahl < 5 ) {
//     echo "Die Zahl ist größer als 3 UND kleiner als 5<br>";
//     echo "Die Zahl in der Variablen: $zahl";
// }

// $zahl = 3;

// Alle Zahlen außer 4
// if ( $zahl <= 3 || $zahl >= 5 ) {
//     echo "Die Zahl ist kleiner/gleich als 3 ODER größer/gleich als 5<br>";
//     echo "Die Zahl in der Variablen: $zahl";
// } 

?>
</body>
</html>