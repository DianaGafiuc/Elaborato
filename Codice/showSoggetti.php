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

$url_api_soggetti = "https://opencoesione.gov.it/it/api/soggetti/";

if(isset($_GET["comune"])) {
    $url_api_soggetti .= "?territorio=" . $_GET["comune"];
} else {
    header("Location: index.php");
}
$curl = curl_init();

        curl_setopt_array($curl, array(
                CURLOPT_URL => $url_api_soggetti,
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
            <th> Denominazione </th>
            <th> Ruoli </th> 
            <th> Costo pubblico </th> 
            <th> Progetti </th> 
           
        </tr>";
        $slugs = array();
        $desc_soggetti = array();

       
        foreach($response ["results"] as $result) {
            $ruoli = $result["ruoli"]; //perchè ruoli è un array
            echo "<tr> <td> ". $result["denominazione"] ." </td> 
            <td> ";
            foreach($ruoli as $ruolo){
                echo $ruolo . "<br>";
            }
            echo " </td>
            <td> ". $result["costo_pubblico"] ." </td> 
            <td> ". $result["progetti"] ." </td> ";
            array_push($slugs, $result["slug"]);
            array_push($desc_soggetti, $result["denominazione"]);
        }
        addSoggetti($slugs ,$desc_soggetti);
        echo "</table>";
        echo "<h1> Pagina " . $response["current_page"] . " di " . $response["last_page"] . "</h1>";


        prevPage();
        nextPage($response["last_page"]);
?>

</html>
