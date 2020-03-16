<?php
$servername = "localhost";
$user = "root";
$pw = "";
$db = "shopeazy";
#Connect to Server
$con = new mysqli($servername, $user, $pw, $db);
if($con->connect_error)
    {
        die('Could not connect: ' . $con->connect_error);
    }
    else
    {
       //echo "Connection established!\n";
    }
$strjson=file_get_contents("products.json");
$array = json_decode($strjson, true);
$i=0;
for($i=0;$i<50;$i++){ 
    $usname = 'anandhakris';
        $name = $array[$i]["title"];
        $description = $array[$i]["description"];
        $price = strval((int) $array[$i]["price"]);
        $image = 'https://picsum.photos/id/'.($i+100).'/200';
        $genre = $array[$i]["type"];
        $sql = "INSERT INTO product (username,name,description,price,image,genre) VALUES ('$usname','$name','$description','$price','$image','$genre')";
        $result = $con->query($sql);
        if($result == TRUE){
        echo "success";
        }
        else {
            echo "error";
        }

}
$con->close();
?>