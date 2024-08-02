<!doctype html>
<html lang="en">

<head>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
    <meta charset="utf-8">
    <title>Kosten Kalkualtor - Schritt 1</title>
    <style>
        p {
            display: flex;
            flex-flow: row;
        }

        label {
            width: 150px;
        }
    </style>
</head>

<body>
    <!-- pattern="^\d+(?:\.\d{1,2})?$" step=".01" bedeutet, dass nur Zahlen akzeptiert werden, die nicht mehr als 2 Kommastellen haben. -->
    <div>
        <p>Bitte füllen Sie dieses Formular aus, um die Gesamtkosten zu berechnen</p>
        <!-- $_SERVER['PHP_SELF'] bedeutet, dass die php auf der Selben Seite ausgeführt wird!  -->
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
            <p>
                <label>
                    Preis in €:
                </label>
                <input type="number" name="preis" min=".01" required="required" placeholder="Preis in €"  step=".01">
            </p>
            <p>
                <label>
                    Anzahl:
                </label>
                <input type="number" name="anzahl" min="1" required="required" value="1">
            </p>
            <p>
                <label>
                    Rabatt in €:
                </label>
                <input type="number" name="rabatt" min="0" required="required" placeholder="Rabatt in €" pattern="^\d+(?:\.\d{1,2})?$" step=".01">
            </p>
            <p>
                <label>Steuern in %:
                </label>
                <input type="number" name="steuern" min="0" required="required" placeholder="Steuern in %" pattern="^\d+(?:\.\d{1,2})?$" step=".01">
            </p>
            <p>
                <label>
                    Wie viele Zahlungsraten?
                </label>
                <input type="number" name="raten" min="1" required="required" placeholder="Anzahl der Raten">
            </p>
            <input type="submit" name="submit"  value="Berechnen">
        </form>
       <a href="kalkulation-01.php"> <button name="reset"> Neu Laden </button></a>
    </div>
<?php

//Abfragen ob Submit geklickt wurde
if (isset($_POST['submit'])) {
    // Werte aus dem $_POST Array
    $preis = $_POST['preis'];
    $anzahl = $_POST['anzahl'];
    $rabatt = $_POST['rabatt'];
    $steuern =$_POST['steuern'];
    $raten = $_POST['raten'];
 // // Gesamtkosten vor Steuern berechnen
    $gesamtnet = $preis * $anzahl - $rabatt;
    // Brutto berechnen
    $gesamtbru = $gesamtnet * $steuern / 100 + $gesamtnet;
    // Steuern in € berechnen
    $gesamtste = $gesamtbru / 100 * $steuern;
    // Monatliche Rate berechnen
    $ratepm = $gesamtbru / $raten;
    // Zahlen formatieren
        $preisf = number_format($preis, 2, ",", ".");
        $rabattf = number_format($rabatt, 2, ",", ".");
        $gesamtnetf = number_format($gesamtnet, 2, ",", ".");
        $steuernf = number_format($steuern, 2, ",", ".");
        $gesamtbruf = number_format($gesamtbru, 2, ",", ".");
        $gesamtstef = number_format($gesamtste, 2, ",", ".");
        $ratepmf = number_format($ratepm, 2, ",", ".");

    include "bestellung.php";


} else {
    print "Bitte Trage deine Zahlen ein!";

}
?>