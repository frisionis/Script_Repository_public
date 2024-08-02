<html>
<head>
    <title>Schleifen</title>
    <meta charset="utf-8" />
</head>
<body>
<?php



// Übung 1
// for( $i = 1; $i <= 50; $i++) {
//     echo "$i. ";
// }

// echo "<br>";
// Übung 2
// for($i=1; $i<=96; $i=$i+5) {
//     echo"$i. ";
// }
//Übung 3
// echo "<br>";
// $i=1;
// while($i<=8192) {
//     echo "$i. ";
//     $i=$i*2;
// }
// echo "<br>";
// Übung 4
// for($i=1; $i<=100; $i++) {
//     switch(true) {
//         case $i%4==0 && $i%5==0:
//         $vf= "$i ist ein vielfaches von 4 und 5.";
//         break;
//         case $i%4==0:
//         $vf ="$i ist ein vielfaches von 4.";
//         break;
//         case $i%5==0:
//         $vf="$i ist ein vielfaches von 5.";
//         break;
//         default:
//         $vf=$i;
//     }

// echo "$vf <br>";
// }
// Übung 5
// for($i=1; $i <=1; $i++) {
//     print $i;
//     echo "<br>";
//     for($j=1; $j <=2; $j++) {
//         print $j;
//     }
//     echo "<br>";
//     for($k=1; $k<=3; $k++) {
//         print $k;
//     }
//     echo "<br>";
//     for ($l=1; $l<=4; $l++) {
//         print $l;
//     }
//     echo "<br>";
//     for ($m=1; $m<=5; $m++) {
//         print $m;
//     }
//     echo "<br>";
//     for ($n=1; $n<=6; $n++) {
//         print $n;
//     }
//     echo "<br>";
//     for ($o=1; $o<=7; $o++) {
//         print $o;
//     }
//     echo "<br>";
//     for ($p=1; $p<=8; $p++) {
//         print $p;
//     }
//     echo "<br>";
//     for ($q=1; $q<=9; $q++) {
//         print $q;
//     }
//     echo "<br>";
//     for ($r=1; $r<=10; $r++) {
//         print $r;
//     }
// }

// ÜBUNG 6
if (isset($_POST['submit'])) {
    switch (true) {
    case $_POST['sel1'] == $_POST['sel2'] || $_POST['pl1'] == $_POST['pl2']:
        print "<script> alert(\"Spielernamen sind identisch oder die Auswahl von Kopf oder Zahl ist identisch\");</script>";
        break;
    default:
        $i = "1"; // 1 oder 2 (Kopf oder Zahl)
        $kc = 0; // Kopf counter
        $zc = 0; // Zahl counter
        $r = $_POST['round']; // Anzahl der Runden

        for ($i="1"; $i<=$r; $i++) {
            $j = rand(1, 2);
            
            switch (true) {
            case 1 == $j:
                $kc++;
                break;
            case 2 == $j:{
                    $zc++;
                }

            }
        }
        if ("Kopf" == $_POST['sel1']) { // Wenn Kopf dann setze pl1 auf Kopf, sonst auf Zahl.
            $koz1 = $kc;
        } else {
            $koz1 = $zc;
        }
        if ("Kopf" == $_POST['sel2']) { // Wenn Kopf dann setze pl2 auf Kopf, sonst auf Zahl.
            $koz2 = "$kc";
        } else {
            $koz2 = "$zc";
        }
        $pl1 = array($_POST['pl1'], $_POST['sel1'], $koz1); // Name des Spielers, Kopf oder Zahl, counter
        $pl2 = array($_POST['pl2'], $_POST['sel2'], $koz2); // Name des Spielers, Kopf oder Zahl, counter
        $pl1info = "<b>$pl1[0]</b> hat <b>$pl1[1]</b> ausgewählt. <b>$pl1[1]</b> wurde in diesem Durchlauf $pl1[2] mal geworfen.";
        $pl2info = "<b>$pl2[0]</b> hat <b>$pl2[1]</b> ausgewählt. <b>$pl2[1]</b> wurde in diesem Durchlauf $pl2[2] mal geworfen.";
        $win1 = "<b>$pl1[0] </b>konnte sich gegen <b>$pl2[0]</b> mit <b>$pl1[2]</b> zu <b>$pl2[2]</b> durchsetzen. Glückwunsch!";
        $win2 = "<b>$pl2[0]</b> konnte sich gegen <b>$pl1[0]</b> mit <b>$pl2[2]</b> zu <b>$pl1[2]</b> durchsetzen. Glückwunsch!";
        $dr = "<b>Unentschieden!</b> $pl1[2] zu $pl2[2].";
        switch (true) { // Gewinner ermitteln!
        case $pl1[2] > $pl2[2]:
            $winner = $win1; // Spieler 1 Gewinnt
            break;
        case $pl1[2] < $pl2[2]:
            $winner = $win2; // Spieler 2 Gewinnt
            break;
        default:
            $winner = $dr; // Unentschieden
        }

    }

}
?>
<!-- Eingabefeld! -->
<form action="" method="post">
    <table>
        <tr>
            <td> <input <?php if (isset($pl1[0])) print "value=\"$pl1[0]\""?> onfocus="this.value=''" type="text" name="pl1" placeholder="Spieler 1">
            </td>
            <td><input <?php if (isset($pl2[0])) print "value=\"$pl2[0]\""?> onfocus="this.value=''" type="text" name="pl2" placeholder="Spieler 2"></td>
        </tr>
        <tr>
            <td> 
                <select name="sel1">
                    <option <?php if(isset($pl1)) if ($pl1[1] == "Kopf") print "selected"; else print ""; ?> value="Kopf">Kopf</option>
                    <option <?php if(isset($pl1)) if ($pl1[1] == "Zahl") print "selected"; else print ""; ?> value="Zahl">Zahl</option>
                </select>
            </td>
            <td>
                <select name="sel2">
                    <option <?php if(isset($pl2)) if ($pl2[1] == "Zahl") print "selected"; ?> value="Zahl">Zahl</option>
                    <option <?php if(isset($pl2)) if ($pl2[1] == "Kopf") print "selected"; ?> value="Kopf">Kopf</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><input <?php if (isset($r)) print "value=\"$r\""?> type="number" min="1" step="1" name="round" onfocus="this.value=''" placeholder="Wie viele Runden?"></td>
            <td style="text-align:right;"><input type="submit" name="submit"></td>
        </tr>
    
    </table>
</form>

<!-- Sieger anzeigen -->
<table>
    <tr>
        <td><?php if(isset($pl1info)) print $pl1info?></td>
    </tr>
    <tr>
        <td><?php if(isset($pl2info)) print $pl2info?></td>
    </tr>
    <tr>
        <td><?php if(isset($winner)) print $winner ?></td>
    </tr>
    <tr>
        <td><?php if(isset($r)) print "Es wurde $r mal geworfen" ?></td>
    </tr>
</table>
</body>
</html>