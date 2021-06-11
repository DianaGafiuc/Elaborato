<html>
 <link rel="stylesheet" href="style2.css">
 <body>
       <header>
            <img src="../Logo2.png" alt="Logo" width="200" height="30" class="logo">
            <nav>
                <ul class="menu">
                   <li><a href="../index.html">Home</a></li>
                   <li><a href="https://opencavallerizza.webflow.io/" target="_blank">Sito progetto</a></li>
                   <li><a href="https://it.monithon.eu/report/view/1054" target="_blank">Report Monithon</a></li>
                   <li><a href="https://opencoesione.gov.it/it/progetti/1misefsc-museirealito20/" target="_blank">OpenCoesione</a></li>
                   <li><a href="https://opencoesione.gov.it/it/api/" target="_blank">API OpenCoesione</a></li>     
                </ul>
            </nav> 
            <button><a href="mailto:projectavo@itisavogadro.it">Contattaci</a></button>  
       </header> 
</body>


<?php
INCLUDE "methods.php";

$url_api_progetti = "https://opencoesione.gov.it/it/api/progetti/";

if(isset($_GET["comune"])) {
    $url_api_progetti .= "?territorio=" . $_GET["comune"];
} else {
    header("Location: index.php");
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
        //print_r($response["results"]);
     /* foreach($response["results"] as $result) {
            print_r($result);
            echo "<br>";
        }*/
?>

<?php
        //print_r($response);

        echo "<table> 
        <tr> 
            <th> Titolo progetto </th>
            <th> Codice progetto </th> 
            <th> Codice cup </th> 
            <th> Natura </th>
            <th> Tema </th> 
            <th> Costo pubblico </th>
            <th> Stato progetto </th> 
            <th> Pagamenti totali </th> 
            <th> Percentuale avanzamento </th>
        </tr>";
        $denominazioni = array();
        $ids = array();
        $progetti = array();

        //print_r($response ["results"]);

        foreach($response ["results"] as $result) {
           // $filtri = $result["filtri"];
            echo "<tr> 
            <td> ". $result["oc_titolo_progetto"] ." </td>
            <td> ". $result["cod_locale_progetto"] ." </td> 
            <td> ". $result["cup"] ." </td> 
            <td> ". $result["cup_descr_natura"] ." </td> 
            <td> ". $result["oc_tema_sintetico"] ." </td> 
            <td> ". $result["oc_finanz_tot_pub_netto"] ." </td> 
            <td> ". $result["oc_stato_progetto"] ." </td>
            <td> ". $result["tot_pagamenti"] ." </td>
            <td> ". $result["percentuale_avanzamento"] ." </td>";
            //echo "<br>";
            //print_r($result);
            //addTerritorio($result["cod_com"], $result["slug"]);
            //array_push($denominazioni, $result["slug"]);
           // array_push($ids, $result["cod_com"]);

           


           $progetto = array(
            "id_progetto" => $result["cod_locale_progetto"],
            "nome" => $result["oc_titolo_progetto"],
            "descrizione" => "",
            "tot_pagamenti" => $result["tot_pagamenti"],
            "perc_av" => $result["percentuale_avanzamento"],
            "id_tema" => getID("temi", $result["oc_tema_sintetico"]),
            "id_natura" => getID("natura", $result["cup_descr_natura"]),
            "id_stato" => getID("stato", $result["oc_stato_progetto"]),
            "soggetti" => $result["soggetti"],
            "territori" =>$result["territori"]
           );
        array_push($progetti, $progetto);
      

        } 
        //print_r($progetti);
        addProgetti($progetti);



      // addTerritori($ids, $denominazioni);
        echo "</table>";
        echo "<h1> Pagina " . $response["current_page"] . " di " . $response["last_page"] . "</h1>";

        prevPage();
        nextPage($response["last_page"]);
        
?>

 
</html>
