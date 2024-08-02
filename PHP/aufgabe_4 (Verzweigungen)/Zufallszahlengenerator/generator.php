<?php 
$zahl = floatval(rand(0,10));

// if ($zahl < 5) {
//     print "Die Zahl $zahl ist kleiner als 5";
// }
// else if ($zahl > 5) {
//     print "Die Zahl $zahl ist größer als 5.";
// }
// else {
//     print "Die Zahl entspricht $zahl.";
// }
switch (true) {
    case $zahl < 5:
        print "Die Zahl $zahl ist kleiner als 5.";
        break;
    case $zahl > 5:
        print "Die Zahl $zahl ist größer als 5.";
        break;
    default:
        print "Die Zahl entspricht 5.";
}


?>

