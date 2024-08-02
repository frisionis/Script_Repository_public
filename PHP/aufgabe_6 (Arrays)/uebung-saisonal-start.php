<?php


$months = [
    'January' => 'Winter',
    'February' => 'Winter',
    'March' => 'Frühling',
    'April' => 'Frühling',
    'May' => 'Frühling',
    'June' => 'Sommer',
    'July' => 'Sommer',
    'August' => 'Sommer',
    'September' => 'Herbst',
    'October' => 'Herbst',
    'November' => 'Herbst',
    'December' => 'Winter'
];

$ausgabe = [
    'Frühling'  => 'Rennräder für den Start in den Frühling',
    'Sommer'    => 'Leichte Kleidung für das Joggen im Park',
    'Herbst'    => 'Hallenschuhe für eine Runde Squash',
    'Winter'    => 'Unsere neuen Snowboards sind eingetroffen'
];


foreach ($months as $k => $mon) {       
    if ($k == date('M')) {
        print $ausgabe[$mon];
        break;
    } 
}


?>