<?php
	// Array anlegen
	$colors= ["#5FB404", "#B40404", "#2E2EFE", "#00FF80", "#FA5882", "#0404B4",];
	$colorsback= ["red", "blue", "green", "grey", "yellow", "black",];
	// Anzahl der Array-Elemente zählen und in Variable speichern
	$countcol= count($colors);
	$countback= rand(0,count($colorsback)-1);
	$numquad= 800;
	$widthquad= 50;
	$heightquad= 1;
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Zufallsfarben</title>
  	<style type="text/css">
	body {
		margin: 0;
		padding: 0;
		background: <?php echo $colorsback[$countback]; ?>;
	}
	.quadrat {
		float: left;
		width: 5%;
		height: 0;
		padding-bottom: 5%; 
	}
  	</style>
  </head>
  <body>
    <?php
		for ($i=0;$i<$numquad; $i++) {
		$random= rand(0,$countcol-1);
		echo "<div class=\"quadrat\" style=\" height:". $heightquad ."px; width:". $widthquad ."px; background:" . $colors[$random] . "\"></div>";
		// for-Schleife schließen
		}
    ?>
  </body>
</html>