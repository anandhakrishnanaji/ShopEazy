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
	$uname=$_POST["username"];
	$pword=$_POST["password"];
	//echo "$uname\n";
	//echo "$pword\n";
	$sql="SELECT * FROM login WHERE username = '$uname'";

	$result = $con->query($sql);
	if ($result->num_rows > 0) {
		while($row =$result->fetch_assoc()) {
			echo ($row["passwords"]==$pword);
		}
	} 
	else {
		echo "0";
	}
    $con->close();
?>