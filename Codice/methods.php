<?php
    function addProgetto() {

    }

    function addSoggetto() {

    }

    function addTerritori(array $ids, array $denominazioni) {
        INCLUDE "connection.php";
        $sql = "INSERT INTO territori VALUES (?,?)";
        $stmt = $conn->prepare($sql);
        $i = 0;

        while($i < count($ids)) {
            $stmt-> bind_param("is", $ids[$i], $denominazioni[$i]);
            $stmt-> execute();
            $i++;
        }
    }

    function addElementIgnore($nome_tabella, $descrizione) {
        INCLUDE "connection.php";
        $sql = "INSERT IGNORE INTO ". $nome_tabella ." (descrizione) VALUES (?)";
        $stmt = $conn->prepare($sql);
        $stmt-> bind_param("s", $descrizione);
        $stmt-> execute();
}
?>