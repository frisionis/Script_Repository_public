<form action="" method="post">
<label>Kommentar abgeben</label> <br><textarea name="comment" placeholder="Kommentar abgeben"></textarea><br>
<input type="submit" name="submit">


<?php

$filter=["penner", "arsch", "doof", "dummkopf"];


if (isset($_POST['submit']))
{
$comment = $_POST['comment'];
$filtered=str_replace($filter, "****",$comment);
print $filtered;
}

 ?>

