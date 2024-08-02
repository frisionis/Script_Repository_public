<?php

/* =================================================================

    Auch mit GET demonstrieren!

=================================================================== */

$h1 = "<h1>Hallo " . $_POST['benutzer'] . "</h1>";

$hgFarbe = $_POST['lieblingsfarbe'];

?>

<html>
<head>
<title>Forms</title>

</head>
<body style="background: <?php echo $hgFarbe; ?>;">

<?php echo $h1; ?>

</body>
</html>