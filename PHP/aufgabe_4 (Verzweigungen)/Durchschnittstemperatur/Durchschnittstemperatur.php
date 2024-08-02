<?php
$div14 = 0;
$div15 = 0;
$div16 = 0;
$div17 = 0;
if (isset($_POST['submit'])) {
    $kw14 = array(
        $_POST['kw14_1'],
        $_POST['kw14_2'],
        $_POST['kw14_3'],
        $_POST['kw14_4'],
        $_POST['kw14_5'],
        $_POST['kw14_6'],
        $_POST['kw14_7'],
    );
    $kw14s = array_sum($kw14) / 7;
    $kw15 = array(
        $_POST['kw15_1'],
        $_POST['kw15_2'],
        $_POST['kw15_3'],
        $_POST['kw15_4'],
        $_POST['kw15_5'],
        $_POST['kw15_6'],
        $_POST['kw15_7'],
    );
    $kw15s = array_sum($kw15) / 7;
    $kw16 = array(
        $_POST['kw16_1'],
        $_POST['kw16_2'],
        $_POST['kw16_3'],
        $_POST['kw16_4'],
        $_POST['kw16_5'],
        $_POST['kw16_6'],
        $_POST['kw16_7'],
    );
    $kw16s = array_sum($kw16) / 7;
    $kw17 = array(
        $_POST['kw17_1'],
        $_POST['kw17_2'],
        $_POST['kw17_3'],
        $_POST['kw17_4'],
        $_POST['kw17_5'],
        $_POST['kw17_6'],
        $_POST['kw17_7'],
    );
    if ($kw14[0] > "0") {
        $div14 = $div14 + 1;
    } else {
        $div14 = $div14;
    }
    if ($kw14[1] > "0") {
        $div14 = $div14 + 1;
    } else {
        $div14 = $div14;
    }
    if ($kw14[2] > "0") {
        $div14 = $div14 + 1;
    } else {
        $div14 = $div14;
    }
    if ($kw14[3] > "0") {
        $div14 = $div14 + 1;
    } else {
        $div14 = $div14;
    }
    if ($kw14[4] > "0") {
        $div14 = $div14 + 1;
    } else {
        $div14 = $div14;
    }
    if ($kw14[5] > "0") {
        $div14 = $div14 + 1;
    } else {
        $div14 = $div14;
    }
    if ($kw14[6] > "0") {
        $div14 = $div14 + 1;
    } else {
        $div14 = $div14;
    }
    if ($div14 == "0") {
        $kw14s = 0;
    } else {
        $kw14s = array_sum($kw14) / $div14;
    }
    if ($kw15[0] > "0") {
        $div15 = $div15 + 1;
    } else {
        $div15 = $div15;
    }
    if ($kw15[1] > "0") {
        $div15 = $div15 + 1;
    } else {
        $div15 = $div15;
    }
    if ($kw15[2] > "0") {
        $div15 = $div15 + 1;
    } else {
        $div15 = $div15;
    }
    if ($kw15[3] > "0") {
        $div15 = $div15 + 1;
    } else {
        $div15 = $div15;
    }
    if ($kw15[4] > "0") {
        $div15 = $div15 + 1;
    } else {
        $div15 = $div15;
    }
    if ($kw15[5] > "0") {
        $div15 = $div15 + 1;
    } else {
        $div15 = $div15;
    }
    if ($kw15[6] > "0") {
        $div15 = $div15 + 1;
    } else {
        $div15 = $div15;
    }
    if ($div15 == "0") {
        $kw15s = 0;
    } else {
        $kw15s = array_sum($kw15) / $div15;
    }
    if ($kw16[0] > "0") {
        $div16 = $div16 + 1;
    } else {
        $div16 = $div16;
    }
    if ($kw16[1] > "0") {
        $div16 = $div16 + 1;
    } else {
        $div16 = $div16;
    }
    if ($kw16[2] > "0") {
        $div16 = $div16 + 1;
    } else {
        $div16 = $div16;
    }
    if ($kw16[3] > "0") {
        $div16 = $div16 + 1;
    } else {
        $div16 = $div16;
    }
    if ($kw16[4] > "0") {
        $div16 = $div16 + 1;
    } else {
        $div16 = $div16;
    }
    if ($kw16[5] > "0") {
        $div16 = $div16 + 1;
    } else {
        $div16 = $div16;
    }
    if ($kw16[6] > "0") {
        $div16 = $div16 + 1;
    } else {
        $div16 = $div16;
    }
    if ($div16 == "0") {
        $kw16s = 0;
    } else {
        $kw16s = array_sum($kw16) / $div16;
    }
    if ($kw17[0] > "0") {
        $div17 = $div17 + 1;
    } else {
        $div17 = $div17;
    }
    if ($kw17[1] > "0") {
        $div17 = $div17 + 1;
    } else {
        $div17 = $div17;
    }
    if ($kw17[2] > "0") {
        $div17 = $div17 + 1;
    } else {
        $div17 = $div17;
    }
    if ($kw17[3] > "0") {
        $div17 = $div17 + 1;
    } else {
        $div17 = $div17;
    }
    if ($kw17[4] > "0") {
        $div17 = $div17 + 1;
    } else {
        $div17 = $div17;
    }
    if ($kw17[5] > "0") {
        $div17 = $div17 + 1;
    } else {
        $div17 = $div17;
    }
    if ($kw17[6] > "0") {
        $div17 = $div17 + 1;
    } else {
        $div17 = $div17;
    }
    if ($div17 == "0") {
        $kw17s = 0;
    } else {
        $kw17s = array_sum($kw17) / $div17;
    }
    switch (true) {
        case $kw14s > 12:
            echo "in der kw14 war der Schnitt ist höher als im April<br>";
            break;
        case $kw14s < 12:
            echo "in der kw14 war der Schnitt ist kleiner als im April<br>";
            break;
        default:
            echo "da ist was falsch<br>";
    }

    switch (true) {
        case $kw15s > 12:
            echo "in der kw15 war der Schnitt ist höher als im April<br>";
            break;
        case $kw15s < 12:
            echo "in der kw15 war der Schnitt ist kleiner als im April<br>";
            break;
        default:
            echo "da ist was falsch<br>";
    }

    switch (true) {
        case $kw16s > 12:
            echo "in der kw16 war der Schnitt ist höher als im April<br>";
            break;
        case $kw16s < 12:
            echo "in der kw16 war der Schnitt ist kleiner als im April<br>";
            break;
        default:
            echo "da ist was falsch<br>";
    }

    switch (true) {
        case $kw17s > 12:
            echo "in der kw17 war der Schnitt ist höher als im April<br>";
            break;
        case $kw17s < 12:
            echo "in der kw17 war der Schnitt ist kleiner als im April<br>";
            break;
        default:
            echo "da ist was falsch<br>";
    }
} else {
    $kw14s = "0";
    $kw15s = "0";
    $kw16s = "0";
    $kw17s = "0";
}

?>
 <!DOCTYPE html>
<html lang="de">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Durchschnittstemperatur</title>
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    /* display: none; <- Crashes Chrome on hover */
    -webkit-appearance: none;
    margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
}

input[type=number] {
    -moz-appearance:textfield; /* Firefox */
}
</style>
</head>

<body>
	<html>
	<h1>Durchschnittstemperatur</h1>
	<form method="post" action="">
		<table>
			<tr>
				<th>KW</th>
				<th>Montag</th>
				<th>Dienstag</th>
				<th>Mittwoch</th>
				<th>Donnerstag</th>
				<th>Freitag</th>
				<th>Samstag</th>
				<th>Sonntag</th>
				<th>Durchschnitt</th>
			</tr>
			<tr>
				<td>14</td>
				<td>
					<input name="kw14_1" <?php if (isset($kw14[0])) { print "value=\"$kw14[0]\""; } ?> type="number"></td>
				<td>
					<input name="kw14_2" <?php if (isset($kw14[1])) { print "value=\"$kw14[1]\""; } ?> type="number"></td>
				<td>
					<input name="kw14_3" <?php if (isset($kw14[2])) { print "value=\"$kw14[2]\""; } ?> type="number"></td>
				<td>
					<input name="kw14_4" <?php if (isset($kw14[3])) { print "value=\"$kw14[3]\""; } ?> type="number"></td>
				<td>
					<input name="kw14_5" <?php if (isset($kw14[4])) { print "value=\"$kw14[4]\""; } ?> type="number"></td>
				<td>
					<input name="kw14_6" <?php if (isset($kw14[5])) { print "value=\"$kw14[5]\""; } ?> type="number"></td>
				<td>
					<input name="kw14_7" <?php if (isset($kw14[6])) { print "value=\"$kw14[6]\""; } ?> type="number"></td>
				<td><?php echo number_format($kw14s, 2, ',', '.');?> aus <?php echo $div14;?> Tagen</td>
			</tr>
			<tr>
				<td>15</td>
				<td>
					<input name="kw15_1" <?php if (isset($kw15[0])) { print "value=\"$kw15[0]\""; } ?> type="number"></td>
				<td>
					<input name="kw15_2" <?php if (isset($kw15[1])) { print "value=\"$kw15[1]\""; } ?> type="number"></td>
				<td>
					<input name="kw15_3" <?php if (isset($kw15[2])) { print "value=\"$kw15[2]\""; } ?> type="number"></td>
				<td>
					<input name="kw15_4" <?php if (isset($kw15[3])) { print "value=\"$kw15[3]\""; } ?> type="number"></td>
				<td>
					<input name="kw15_5" <?php if (isset($kw15[4])) { print "value=\"$kw15[4]\""; } ?> type="number"></td>
				<td>
					<input name="kw15_6" <?php if (isset($kw15[5])) { print "value=\"$kw15[5]\""; } ?> type="number"></td>
				<td>
					<input name="kw15_7" <?php if (isset($kw15[6])) { print "value=\"$kw15[6]\""; } ?> type="number"></td>
				<td>
					<?php echo number_format($kw15s, 2, ',', '.');?> aus <?php echo $div15; ?> Tagen</td>
			</tr>
			<tr>
				<td>16</td>
				<td>
					<input name="kw16_1" <?php if (isset($kw16[0])) { print "value=\"$kw16[0]\""; } ?> type="number"></td>
				<td>
					<input name="kw16_2" <?php if (isset($kw16[1])) { print "value=\"$kw16[1]\""; } ?> type="number"></td>
				<td>
					<input name="kw16_3" <?php if (isset($kw16[2])) { print "value=\"$kw16[2]\""; } ?> type="number"></td>
				<td>
					<input name="kw16_4" <?php if (isset($kw16[3])) { print "value=\"$kw16[3]\""; } ?> type="number"></td>
				<td>
					<input name="kw16_5" <?php if (isset($kw16[4])) { print "value=\"$kw16[4]\""; } ?> type="number"></td>
				<td>
					<input name="kw16_6" <?php if (isset($kw16[5])) { print "value=\"$kw16[5]\""; } ?> type="number"></td>
				<td>
					<input name="kw16_7" <?php if (isset($kw16[6])) { print "value=\"$kw16[6]\""; } ?> type="number"></td>
				<td>
					<?php echo number_format($kw16s, 2, ',', '.'); ?> aus<?php echo $div16; ?> Tagen</td>
			</tr>
			<tr>
				<td>17</td>
				<td>
					<input name="kw17_1" <?php if (isset($kw17[0])) { print "value=\"$kw17[0]\""; } ?> type="number"></td>
				<td>
					<input name="kw17_2" <?php if (isset($kw17[1])) { print "value=\"$kw17[1]\""; } ?> type="number"></td>
				<td>
					<input name="kw17_3" <?php if (isset($kw17[2])) { print "value=\"$kw17[2]\""; } ?> type="number"></td>
				<td>
					<input name="kw17_4" <?php if (isset($kw17[3])) { print "value=\"$kw17[3]\""; } ?> type="number"></td>
				<td>
					<input name="kw17_5" <?php if (isset($kw17[4])) { print "value=\"$kw17[4]\""; } ?> type="number"></td>
				<td>
					<input name="kw17_6" <?php if (isset($kw17[5])) { print "value=\"$kw17[5]\""; } ?> type="number"></td>
				<td>
					<input name="kw17_7" <?php if (isset($kw17[6])) { print "value=\"$kw17[6]\""; } ?> type="number"></td>
				<td>
					<?php echo number_format($kw17s, 2, ',', '.'); ?> aus<?php echo $div17; ?> Tagen</td>
			</tr>
		</table>
		<br>
		<input type="submit" name="submit" value="Absenden"> </form>
</body>

</html>