<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HTML und PHP mischen</title>
</head>
<body>


<!-- Variablen für den Text laden  -->

<?php 
    $css = "<style> h2 {background: #DF7401;";
// $css2 ist der Inhalt von $css und plus dem, was in den "" aus $css2 ist. Durch einen Punkt verbunden
    $css2 = $css ."padding: 20px; </style>";        
    $Ueberschrift = "<h2> Gummibärchen </h2>";
    $strong = "<strong> Freilebende</strong>";
    $strong2 = "<strong> Kinokasse</strong>";
    $strong3 = "<strong>Gummibärchen-Mensch</strong>";
    $strong4 = "<strong>weichgekochter Radiergummi</strong>";

    // Beginn Aufgabe 2 - Flächenberechnung
    // Rechteck 
    $RechteckBreite = 20;
    $RechteckHoehe = 10;
    $RechteckGesamt = $RechteckBreite * $RechteckHoehe ;

    // Dreieck
    $GrundseiteDreieck = 14;
    $HoeheDreieck = 5;
    $DreieckGesamt = $GrundseiteDreieck * $HoeheDreieck / 2;

    // Kreis
    $RadiusKreis = 5;
    $pi = pi();
    $KreisGesamt2 = $RadiusKreis * $RadiusKreis * $pi;
    $KreisGesamt= round( $KreisGesamt2, 4,  PHP_ROUND_HALF_DOWN);
   
 ?>


<!-- background und padding laden  -->

<?php echo "$css2" ?>

<!-- Textbeginn -->

    <?php echo "$Ueberschrift" ?>
    <p>
        <?php echo "$strong" ?> Gummibärchen gibt es nicht. Man kauft sie in Packungen an der <?php echo "$strong2" ?>. Dieser Kauf ist der Beginn einer fast erotischen und sehr ambivalenten Beziehung <?php echo "$strong3" ?>. Zuerst genießt man. Dieser Genuß umfaßt alle Sinne. Man wühlt in den Gummibärchen, man fühlt sie. Gummibärchen haben eine Konsistenz wie <?php echo "$strong4" ?>.
    </p>


<h2>Flächenberechnung</h2>


<!-- Rechteck anzeigen -->
<div style="display: flex; flex-flow: row wrap; align-content: center; justify-content: space-between; padding: 0 40px 0 40px;">
    <div style="display: flex;flex-flow: row wrap;align-content: center; justify-content: center;">
         <div style=" background: #DF7401; width: 8cm; height: 4cm; border: 2px solid black; display: flex; flex-flow: row wrap; align-content: center; justify-content: center;">
             <p>Die Größe des Rechtecks beträgt <?php echo "$RechteckGesamt"; ?> cm². <br> Rechenweg: <?php echo "$RechteckBreite * $RechteckHoehe"?> </p> 
         </div>
    </div>
<!-- Dreieck anzeigen  -->
    <div style="display: flex; flex-flow: column wrap;align-content: center; justify-content:center;">
        <span style="width: 0; height: 0; border-left: 50px solid transparent; border-right: 50px solid transparent; border-bottom: 100px solid #DF7401;"></span>
        <p>Das Dreieck hat eine Fläche von <?php echo "$DreieckGesamt"; ?> cm².<br> Rechenweg: <?php echo "$GrundseiteDreieck * $HoeheDreieck / 2 "?> </p>
    </div>
<!-- Kreis anzeigen  -->
    <div style="display: flex; flex-flow: column wrap;align-content: center; justify-content:center;">
        <span style="background:#DF7401; width: 100px; height:100px; border: 1px solid black; border-radius: 100px;"></span>
        <p>Der Kreis hat eine Fläche von <?php echo "$KreisGesamt"; ?> cm². <br> Rechenweg: <?php echo "$RadiusKreis * $RadiusKreis * $pi "?></p>
    </div>
</div>
</body>
</html> 