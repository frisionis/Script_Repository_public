<?php 
session_start();

/* =================================================================

	Übung Warenkorb:
	
	a) Machen Sie sich bitte ausführlich mit der Funktionalität
	des Warenkorbs vertraut.

	b) Der Warenkorb nutzt die Session-Funktionalität von PHP. 
	Machen Sie sich bitte mit diesem PHP-Feature mit Hilfe
	folgender Quelle vertraut: 
	https://www.php-einfach.de/php-tutorial/php-sessions/ 

	c) Dieser Warenkorb hat ein Problem :) 2 getrennte Array speichern
	Daten, die zusammengehören. Fassen Sie beide Arrays in ein 
	zweidimensionales Array mit numerischen Indizes zusammen. 
	Diese Umwandlung macht einige Änderungen im folgenden Code 
	nötig, um die Funktionalität des Warenkorbs 
	wiederherzustellen...

=================================================================== */
$products = [
			['Turnschuh', 'Tablet', 'Hemd', 'Limo'],
			['89.99', '349.99', '39.99', '0.99']
			];

/* === Session initialisieren === */
if (!isset($_SESSION['total'])) {
	$_SESSION['total'] = 0;
	for ($i=0; $i < count($products[0]); $i++) {
		$_SESSION['quantity'][$i] = 0;
		$_SESSION['prices'][$i] = 0;
	}
}

/* === Warenkorb zurücksetzen === */
if (isset($_GET['reset'])) {
	if ($_GET['reset'] == 'true') {
		unset($_SESSION['quantity']); // Anzahl für jedes Produkt
		unset($_SESSION['prices']); // Einzelpreise 
		unset($_SESSION['total']); // Gesamtkosten
		unset($_SESSION['products_in_cart']); // Ausgewählte Produkte
	}
}

/* === Waren hinzufügen === */
if (isset($_GET['add'])) {
	$i = $_GET['add'];
	$quantity = $_SESSION['quantity'][$i] + 1;
	$_SESSION['prices'][$i] = $products[1][$i] * $quantity;
	$_SESSION['products_in_cart'][$i] = $i;
	$_SESSION['quantity'][$i] = $quantity;
}

/* === Produkt entfernen === */
if (isset($_GET['delete'])) {
	$i = $_GET['delete'];
	$quantity = $_SESSION['quantity'][$i];
	$quantity--;
	$_SESSION['quantity'][$i] = $quantity;
	//Bei Menge 0 Produkt entfernen
	if ($quantity == 0) {
		$_SESSION['prices'][$i] = 0;
		unset($_SESSION['products_in_cart'][$i]);
	} else {
		$_SESSION['prices'][$i] = $products[1][$i] * $quantity;
	}
}

?>

<style>
	body {
		font-family: Calibri, sans-serif;
	}

	th {
		text-align: left;
		padding: 10px;
	}

	td {
		padding: 10px;
	}
</style>

<h2>Ihre Produkte</h2>

<table>
	<tr>
		<th>Produkt</th>
		<th>Preis</th>
		<th>&nbsp;</th>
	</tr>

<?php for ($i=0; $i< count($products[0]); $i++) { ?>

	<tr>
		<td><?php echo $products[0][$i]; ?></td>
		<td><?php echo $products[1][$i]; ?></td>
		<td><a href="?add=<?php echo $i; ?>">Zum Warenkorb hinzufügen</a></td>
	</tr>

<?php } ?>

	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3"><a href="?reset=true">Warenkorb leeren</a></td>
	</tr>
</table>

<?php if (isset($_SESSION['products_in_cart'])) { ?>

<h2>Warenkorb</h2>
<table>
	<tr>
		<th>Produkt</th>
		<th>Anzahl</th>
		<th>Betrag</th>
		<th>&nbsp;</th>
	</tr>

<?php
	$total = 0;
	foreach ($_SESSION['products_in_cart'] as $i) {
?>

	<tr>
		<td><?php echo $products[0][$_SESSION['products_in_cart'][$i]]; ?></td>
		<?php echo $i; ?>
		<td><?php echo $_SESSION['quantity'][$i]; ?></td>
		<td><?php echo $_SESSION['prices'][$i]; ?></td>
		<td><a href="?delete=<?php echo $i; ?>">Entfernen</a></td>
	</tr>

<?php
		$total = $total + $_SESSION['prices'][$i];
	}
	$_SESSION['total'] = $total;
?>

	<tr>
		<td colspan="4">Gesamtbetrag: <?php echo($total); ?></td>
	</tr>
</table>

<?php
}
?>