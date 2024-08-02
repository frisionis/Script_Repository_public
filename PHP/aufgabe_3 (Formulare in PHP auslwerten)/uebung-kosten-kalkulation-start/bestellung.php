<!doctype html>
<button onclick="visible()">Minimieren</button>



<div id="klick">
    <h4>Ihre Bestellung:</h4>
    <table>
    
            <tr>
                <td><?php print "$anzahl";?></td>
                <td>Produkte</td>
            </tr>
            <tr>
                <td><?php print "$preisf";?> €</td>
                <td>Netto Einzelpreis</td>
            </tr>
            <tr>
                <td> <?php print "$rabattf";?> €</td>
                <td> Rabatt </td>
            </tr>
            <tr>
                <td><?php print "$gesamtnetf";?> €</td>
                <td>Netto Gesamtpreis</td>
            </tr>
            <tr>
                <td><?php print "$steuernf";?> %</td>
                <td>Mehrwertsteuern</td>
            </tr>
            <tr>
                <td><?php print "$gesamtbruf";?> €</td>
                <td>Brutto Gesamtpreis</td>
            </tr>
            <tr>
                <td><?php print "$gesamtstef";?> €</td>
                <td>Davon Steuern</td>
            </tr>
            <tr>
                <td><?php print "$raten";?></td>
                <td>Monatsraten</td>
            </tr>
            <tr>
                <td><?php print "$ratepmf";?> €</td>
                <td>Monatliche Rate</td>
            </tr>
    
        </table>
</div>
    <script>
        function visible() {
        var x = document.getElementById("klick");
        if (x.style.display === "none") {
            x.style.display = "block";
        }   else {
    x.style.display = "none";
  }
}
</script>
    </body>

</html>