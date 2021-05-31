<?php
$url_api_progetti = "https://opencoesione.gov.it/it/api/progetti/";
if(isset($_GET["page"])) {
    $url_api_progetti .= "?page=" . $_GET["page"];
}

$curl = curl_init();

        curl_setopt_array($curl, array(
                CURLOPT_URL => $url_api_progetti,
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

        $i = 0;
        //print_r($response["results"]);
        echo "<h1> Progetti </h1> <h2> pagina ". $response["current_page"] ." di ". $response["last_page"] ."</h2>";
        foreach($response["results"] as $progetto) {
            echo "<br><br><h2> ------ $i </h2>";
            echo("codice progetto:".$progetto["cod_locale_progetto"]."<br>");
            echo("titolo progetto:".$progetto["oc_titolo_progetto"]."<br>");
            echo("tot_pagamenti:".$progetto["tot_pagamenti"]."<br>");
            echo("percentuale_avanzamento:".$progetto["percentuale_avanzamento"]."<br>");
            echo("natura: " . $progetto["cup_descr_natura"] . "<br>");
            echo("stato: " . $progetto["oc_stato_progetto"] . "<br>");
            echo("tema:" . $progetto["oc_tema_sintetico"] . "<br>");

            foreach($progetto["soggetti"] as $soggetto) {
                echo "soggeto:" . $soggetto["denominazione"] . "<br>";
            }

            foreach($progetto["territori"] as $territorio) {
                echo "terriorio:" . $territorio . "<br>";
            }

            $i += 1;
        }


        addProgetto($response["results"]);

        function addProgetto(array $progetti) {
            INCLUDE "connessione.php";
            $sql = "INSERT INTO PROGETTI (id_progetto, nome, descrizione, tot_pagamenti, perc_av, id_tema, id_natura, id_stato)
            VALUES (?,?,?,?,?,?,?,?);";
            $stmt = $conn->prepare($sql);
            $stmt-> bind_param("sssddiii", $id, $nome, $descrizione, $tot_pagamenti, $perc_av, $id_tema, $id_natura, $id_stato);

            foreach($progetti as $progetto) {
                echo "pog - ";
                $id = $progetto["cod_locale_progetto"];
                $nome = $progetto["oc_titolo_progetto"];
                $descrizione = "Descrizione di prova";
                $tot_pagamenti = $progetto["tot_pagamenti"];
                $perc_av = $progetto["percentuale_avanzamento"];
                /*
                $id_tema = $progetto["oc_tema_sintetico"];
                $id_natura = $progetto["cup_descr_natura"];
                $id_stato = $progetto["oc_stato_progetto"];
                */

                $id_tema = 1;
                $id_natura = 1;
                $id_stato = 1;

                $stmt-> execute();
            }
            
        }
?>