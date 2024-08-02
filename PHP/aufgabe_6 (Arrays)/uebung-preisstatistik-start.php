<?php
$preise = [9.99, 11.59, 32.99, 69.95, 34.99, 12.59, 21.95, 86.99, 119.99, 5.50, 6.90, 48.99, 111.50];

// Nach dem größten sortieren
rsort($preise);
print number_format(array_sum($preise) / count($preise),2,",",".") ."<hr>";

// 4 größten
array_splice($preise, 4);
print_r($preise);
print "<hr>";

// 4 kleinsten
$preise = [9.99, 11.59, 32.99, 69.95, 34.99, 12.59, 21.95, 86.99, 119.99, 5.50, 6.90, 48.99, 111.50];
sort($preise);
array_splice($preise, 4);
print_r ($preise);
print "<hr>";

?>