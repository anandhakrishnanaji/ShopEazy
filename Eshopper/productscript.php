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
    $id = $_GET['id'];
    //echo $id;
    $sql="SELECT * FROM product WHERE id = '$id'";

	$result = $con->query($sql);
	if ($result->num_rows > 0) {
		while($row =$result->fetch_assoc()) {
            $uname=$row["username"];
            $name=$row["name"];
            $price=$row["price"];
            $image=$row["image"];
		}
	} 
	else {
		//echo "0";
	}
    $con->close();
?>
