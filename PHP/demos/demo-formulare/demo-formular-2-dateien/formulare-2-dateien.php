<?php

/* =================================================================

    Auch mit GET demonstrieren!

=================================================================== */

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formularverarbeitung in einer anderen Datei</title>

    <style type="text/css">
        body {
            font-size: 20px;
            font-family: Verdana, sans-serif;
        }            
    </style>        
</head>
<body>
    <form method="post" action="verarbeitung.php">

        <p>Wie ist Ihr Name?:</p>
        <p><input type="text" name="benutzer"></p>

        <p>Hintergrundfarbe umstellen?           
            <input type="checkbox" name="lieblingsfarbe" value="red" />Rot      
        </p>

        <input type="submit" value="Absenden" />

    </form>
</body>
</html>