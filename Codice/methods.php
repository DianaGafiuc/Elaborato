<?php
    
    function addTerritori(array $slugs, array $denominazioni) {
        INCLUDE "connection.php";
        $sql = "INSERT INTO territori VALUES (?,?)";
        $stmt = $conn->prepare($sql);
        $i = 0;

        while($i < count($slugs)) {
            $stmt-> bind_param("ss", $slugs[$i], $denominazioni[$i]);
            $stmt-> execute();
            $i++;
        }
    }

    function addSoggetti(array $slugs, array $desc_soggetti){
        INCLUDE "connection.php";
        $sql = "INSERT INTO soggetti VALUES (?,?)";
        $stmt = $conn->prepare($sql);
        $i = 0;

        while($i < count($slugs)) {
            $stmt-> bind_param("ss", $slugs[$i], $desc_soggetti[$i]);
            $stmt-> execute();
            $i++;
        }
    }

    function addProgetti(array $progetti){
        INCLUDE "connection.php";
        $sql = "INSERT INTO progetti VALUES (?,?,?,?,?,?,?,?)";
        $stmt = $conn->prepare($sql);
        
        foreach($progetti as $progetto)
        {
            $stmt-> bind_param("sssddiii", $progetto["id_progetto"], $progetto["nome"],$progetto["descrizione"], $progetto["tot_pagamenti"] ,$progetto["perc_av"] ,$progetto["id_tema"] ,$progetto["id_natura"] ,$progetto["id_stato"]	);
            $stmt-> execute();
            

            addProgetti_soggetti($progetto["id_progetto"], $progetto["soggetti"]);
            addProgetti_territori($progetto["id_progetto"], $progetto["territori"]);
             
        }
    }

    function getID($nome_tabella, $descrizione){
        INCLUDE "connection.php";

        $sql = "SELECT * FROM ". $nome_tabella . " WHERE descrizione = ? ";
        $stmt = $conn->prepare($sql); 
        
        $stmt-> bind_param("s", $descrizione);
        $stmt-> execute();

        $result = $stmt-> get_result();
       // print_r($result);

       if(!empty($result) && $result-> num_rows > 0){
        while($row = $result-> fetch_assoc()){
            return $row["id"];
        }

       }else {
        return addTemiNaturaStato($nome_tabella, $descrizione);
       }
        

    }
    echo getID("temi", "why non funzioni");

    /*function addNatura(array $desc_natura){
        INCLUDE "connection.php";
        $sql = "INSERT INTO soggetti (desc_natura) VALUES (?)";
        $stmt = $conn->prepare($sql);
        $i = 0;

        while($i < count($desc_natura)) {
            $stmt-> bind_param("s", $desc_natura[$i]);
            $stmt-> execute();
            $i++;
        }
    }*/

    function addTemiNaturaStato($nome_tabella, $descrizione){
        INCLUDE "connection.php";
        $sql = "INSERT INTO ". $nome_tabella . " (descrizione)  VALUES (?)";
        $stmt = $conn->prepare($sql);

    
        $stmt-> bind_param("s", $descrizione);
        $stmt-> execute();
        
        return $conn->insert_id;
        
    }
    

    function addProgetti_soggetti($id_progetto, array $id_soggetti){
        INCLUDE "connection.php";
        $sql = "INSERT INTO progetti_soggetti VALUES (?,?)";
        $stmt = $conn->prepare($sql);
        $i = 0;

        while($i < count($id_soggetti)) {
            $stmt-> bind_param("si", $id_progetto, $id_soggetti[$i]);
            $stmt-> execute();
            $i++;
        }
    }

    function addProgetti_territori($id_progetto, array $id_territori){
        INCLUDE "connection.php";
        $sql = "INSERT INTO progetti_territori VALUES (?,?)";
        $stmt = $conn->prepare($sql);
        $i = 0;

        while($i < count($id_territori)) {
            $stmt-> bind_param("ss", $id_progetto, $id_territori[$i]);
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


    function nextPage($last){

        if($last != 1){
            if(isset ($_GET["page"])){
                if($_GET["page"]!= $last)
                {
                    echo "<button><a href=\"index.php?page=". ($_GET["page"]+1);

                    if(isset($_GET["cod_reg"])){
                        echo "&cod_reg=". $_GET["cod_reg"];
                    }
                    echo "\">Next</a></button>";
                }
            }else
            {
                echo "<button><a href=\"index.php?page=2";
                if(isset($_GET["cod_reg"]))
                {
                    echo "&cod_reg=". $_GET["cod_reg"];
                }
                
                echo "\">Next</a></button>";
                
               
            }
        }
        
    }

    function prevPage(){
        if(isset ($_GET["page"])){
            if($_GET["page"]!= 1)
            {
                echo "<button><a href=\"index.php?page=". ($_GET["page"]-1);

                if(isset($_GET["cod_reg"])){
                    echo "&cod_reg=". $_GET["cod_reg"];
                }
                echo "\">Prev</a></button>";
            }
        }
        
        /*else
        {
            echo "<button><a href=\"index.php?page=2&cod_reg=". $_GET["cod_reg"]."\">Prev</a></button> ";
        }*/

    }

?>