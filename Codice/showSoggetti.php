<?php
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
        foreach($response["results"] as $result) {
            print_r($result);
            echo "<br>";
        }
?>