<?php
 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "shopeazy";
    $table1 = "login";
    $table2 = "product";
    $action = $_POST["action"];

    $conn = new mysqli($servername, $username, $password, $dbname);

    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
    }
    else {
      //  echo "Connection Established!!\n";
    }

    if("PRODUCTDEL"==$action){
        $pid=$_POST["id"];
        
        $sql = "DELETE FROM $table2 WHERE id = '$pid'";
        $result=$conn->query($sql);
        if( $result == TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
    }


    if("PRODUCTEDIT" == $action){
        $id=$_POST["id"];
        $name=$_POST["name"];
        $description=$_POST["description"];
        $price=$_POST["price"];
        //(int)$price;
        $image=$_POST["image"];
        $genre=$_POST["genre"];

$sql="UPDATE $table2 SET name = '$name', description = '$description', price =  '$price', image = '$image', genre = '$genre' WHERE id = '$id'";
        $result=$conn->query($sql);
         if( $result == TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
    }

   
    if("ADDPRODUCT" == $action){
        $usname = $_POST["username"];
        $name = $_POST["name"];
        $description = $_POST["description"];
        $price = $_POST["price"];
        $image = $_POST["image"];
        $genre = $_POST["genre"];

        $sql = "INSERT INTO $table2 (username,name,description,price,image,genre) VALUES ('$usname','$name','$description','$price','$image','$genre')";
        $result = $conn->query($sql);
        if($result == TRUE){
        echo "success";
        }
        else {
            echo "error";
        }
        $conn->close();
    }

    if("CREMAN"==$action){
	$usname = $_POST["username"];
        $db_data = array();
        $sql = "SELECT id, name , description , username , price, image , genre FROM $table2 WHERE username = '$usname'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
?>
