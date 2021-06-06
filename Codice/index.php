<?php
INCLUDE "methods.php";
$url_api_territori = "https://opencoesione.gov.it/it/api/territori/";

if(isset($_GET)) {
    $url_api_territori .= "?";
    if(isset($_GET["cod_reg"])) {
        $url_api_territori .= "cod_reg=". $_GET["cod_reg"];
    }
    if(isset($_GET["cod_reg"]) && isset($_GET["page"])) {
        $url_api_territori .= "&&";
    }
    if(isset($_GET["page"])) {
        $url_api_territori .= "page=". $_GET["page"];
    }
}
$curl = curl_init();

        curl_setopt_array($curl, array(
                CURLOPT_URL => $url_api_territori,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET",
                CURLOPT_HTTPHEADER => array("cache-control: no-cache"),
            )
        );

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        $response = json_decode($response, true);
        
        echo "<h1> Pagina " . $response["current_page"] . " di " . $response["last_page"] . "</h1>";
        ?>

<form action="index.php" method="GET">
    <select name="cod_reg">
        <option value="01" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "01") echo("selected") ?>> PIEMONTE </option>
        <option value="02" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "02") echo("selected") ?>> VALLE D’AOSTA </option>
        <option value="03" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "03") echo("selected") ?>> LOMBARDIA </option>
        <option value="04" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "04") echo("selected") ?>> TRENTINO A. A. </option>
        <option value="05" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "05") echo("selected") ?>> VENETO </option>
        <option value="06" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "06") echo("selected") ?>> FRIULI V. G </option>
        <option value="07" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "07") echo("selected") ?>> LIGURIA </option>
        <option value="08" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "08") echo("selected") ?>> EMILIA ROMAGNA </option>
        <option value="09" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "09") echo("selected") ?>> TOSCANA </option>
        <option value="10" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "10") echo("selected") ?>> UMBRIA </option>
        <option value="11" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "11") echo("selected") ?>> MARCHE </option>
        <option value="12" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "12") echo("selected") ?>> LAZIO </option>
        <option value="13" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "13") echo("selected") ?>> ABRUZZO </option>
        <option value="14" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "14") echo("selected") ?>> MOLISE </option>
        <option value="15" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "15") echo("selected") ?>> CAMPANIA </option>
        <option value="16" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "16") echo("selected") ?>> PUGLIA </option>
        <option value="17" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "17") echo("selected") ?>> BASILICATA </option>
        <option value="18" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "18") echo("selected") ?>> CALABRIA </option>
        <option value="19" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "19") echo("selected") ?>> SICILIA </option>
        <option value="20" <?php if(isset($_GET["cod_reg"]) && $_GET["cod_reg"] == "20") echo("selected") ?>> SARDEGNA </option>
    </select>
    <input type="submit" value="Vai">
</form>


<?php
        //print_r($response);

        echo "<table> <tr> <th> Denominazione </th> <th> Tipo </th> <th> Regione </th> <th> Provincia </th>  </tr>";
        $denominazioni = array();
        $ids = array();
        foreach($response ["results"] as $result) {
            $filtri = $result["filtri"];
            echo "<tr> <td> ". $result["denominazione"] ." </td> <td> ". $result["tipo"] ." </td> <td> ". $result["cod_reg"] ." </td> <td> ". $result["cod_prov"] ." </td> <td> <a href='showProgetti.php?comune=". $result["slug"] ."'> Vai ai progetti </a> </td> <td> <a href='showSoggetti.php?comune=". $result["slug"] ."'> Vai ai soggetti </a></td> </tr>";
            //echo "<br>";
            //print_r($result);
            //addTerritorio($result["cod_com"], $result["slug"]);
            array_push($denominazioni, $result["slug"]);
            array_push($ids, $result["cod_com"]);
        } //*/
        addTerritori($ids, $denominazioni);
        echo "</table>"
        
?>