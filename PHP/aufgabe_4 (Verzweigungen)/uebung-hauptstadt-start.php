<?php

    if (isset($_POST['submit'])) {
        $land = $_POST['land'];
    
    switch ($land) {
        case "England":
        $stadt ="London";
        $select1="selected";
        break;
    
        case "Frankreich":
        $stadt = "Paris";
        $select2="selected";
        break;

        case "Italien":
        $stadt = "Rom";
        $select3="selected";
        break;
        case "Spanien":
        $stadt = "Madrid";
        $select4="selected";
        break;
        default: "";

}}
else {
    $land="";
    $stadt="";
}

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Wie heißt die Hauptstdt?</title>
</head>
<body>
    <h3>Wie heißt die Hauptstadt?</h3>
    <form method="post" action="">
        <select name="land">
            <option <?php if ($land=="England") print "selected";?>>England</option>
            <option <?php if ($land=="Frankreich") print "selected" ?>>Frankreich</option>
            <option <?php if ($land=="Italien") print "selected"?>>Italien</option>
            <option <?php if ($land=="Spanien") print "selected" ?>>Spanien</option>
        </select>
        <input type="submit" name="submit" value="Absenden">
    </form>
    
    <h3>Die Hauptstadt heißt:</h3>
    <p><?php print $stadt ?></p>
</body>
</html>