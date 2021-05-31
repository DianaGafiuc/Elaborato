<?php
$servername = "localhost";
$username = "root";      //utente root = amministratore
$password = "";          //lasciare vuoto perchè non c'è una password impostata
$dbname = "poggers";         //nome del nostro database

$conn = new mysqli($servername, $username, $password, $dbname);
?>