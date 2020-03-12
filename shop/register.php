<?php    
    $servername = "localhost";
    $user = "root";
    $pw = "";
    $db = "shopeazy";
    #Connect to Server
    $con = mysqli_connect($servername, $user, $pw, $db);
    if(!$con)
        {
            die('Could not connect: ' . mysql_error());
        }
        else
        {
          // echo "Connection established!\n";
        }
   $fname = $_POST["fname"];
    $username=$_POST["username"];
    $lname = $_POST["lname"];
    $email =$_POST["email"];
    $mobile = $_POST["mobile"];
    (int)$mobile;
    $shopname =$_POST["shopname"];
    $password=$_POST["password"];
  /* echo "$fname\n";
    echo "$username\n";
    echo "$lname\n";
    echo "$email\n";
    echo "$mobile\n";
    echo "$shopname\n";
    echo "$password\n";*/
   $sql="INSERT INTO login (username,fname,lname,email,shopname,mobile,passwords) VALUES ('$username','$fname','$lname','$email','$shopname',$mobile,'$password')";
  
    $result = $con->query($sql);
    if ($result) {
        echo "Success";
    }
    else {
        echo "Failed";
    }
    $con->close();
?>
