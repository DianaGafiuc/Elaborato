<?php
$servername = "localhost";
$username = "root";      //utente root = amministratore
$password = "";          //lasciare vuoto perchè non c'è una password impostata
$dbname = "prova";         //nome del nostro database

//create connection
$conn = new mysqli($servername, $username, $password, $dbname);

?>