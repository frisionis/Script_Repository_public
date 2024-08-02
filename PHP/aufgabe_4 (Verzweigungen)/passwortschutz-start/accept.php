




<?php 

if (isset($_POST['submit'])) {

$usernameform = $_POST['benutzername'];
$passwordform = $_POST['passwort'];
$username = "Kevin";
$password = "1901";
    if ($usernameform == $username && $passwordform == $password) {
        print "richtig";
    }
    else {
        print "passwort falsch";
    }
}

switch(true) {
case ($usernameform == $username && $passwordform == $password):
    print "richtig";
    break;

default:
print "falsch";
}

?>

</html>