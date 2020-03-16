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
$sql="SELECT * FROM product WHERE username = 'anandhakris'";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    while($row =$result->fetch_assoc()) {
        echo '<div class="col-sm-4">
        <div class="product-image-wrapper">
            <div class="single-products">
                <div class="productinfo text-center">
                    <img src="'.$row["image"].'" alt="" />
                    <h2>$'.$row["price"].'</h2>
                    <p>'.$row["name"].'</p>
                    <a href="#" class="btn btn-default add-to-cart"><i
                            class="fa fa-shopping-cart"></i>Add to cart</a>
                </div>

            </div>
        </div>
    </div>';
    }
} 
?>