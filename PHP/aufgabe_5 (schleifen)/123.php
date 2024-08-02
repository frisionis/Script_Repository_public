<?php
for($i=1; $i<=100; $i++) {
    switch(true) {
        case $i%4==0 && $i%5==0:
        $vf= "$i ist ein vielfaches von 4 und 5.";
        break;
        case $i%4==0:
        $vf ="$i ist ein vielfaches von 4.";
        break;
        case $i%5==0:
        $vf="$i ist ein vielfaches von 5.";
        break;
        default:
        $vf=$i;
    }
echo "$vf <br>";
}
?>