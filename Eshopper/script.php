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
    $uname=$_GET["username"];
    if (isset($_GET['id'])) {
        $a=$_GET['id'];
        $sql2="SELECT * FROM shoppingcart WHERE id ='$a' AND username ='$uname'";
        $result2 = $con->query($sql2);
        if($result2==TRUE) {
          //  echo "<h1>1</h1>";
        }
        else{
           // echo "<h1>0</h1>";
        }
        if($result2->num_rows > 0) {
            $row3=$result2->fetch_assoc();
            
            $quantity=strval(((int)$row3["quantity"]+1));
            //echo "<h1>$quantity</h1>";
            $ppid=strval($row3["orderid"]);
            $result3=$con->query("UPDATE shoppingcart SET quantity = '$quantity' WHERE orderid = '$ppid'");
            if($result3==TRUE) {
                //echo "1";
            }
            else{
                //echo "<h1>0</h1>";
            }
        }
        else{
        //echo "<h1>$a</h1>";
        $date=date("D M d, Y G:i");
        $sql1="INSERT INTO shoppingcart (id, username, creationtime, quantity) VALUES ('$a', '$uname', '$date', '1')";
        $result1 = $con->query($sql1);
        if($result1==TRUE) {
            //echo "1";
        }
        else{
            //echo "<h1>0</h1>";
        }
    }
      }
$sql="SELECT * FROM product WHERE username = '$uname'";
$result = $con->query($sql);
if ($result->num_rows > 0) {
    while($row =$result->fetch_assoc()) {
        echo '<a href="product-details.php?id='.$row["id"].'"><span><div class="col-sm-4">
        <div class="product-image-wrapper">
            <div class="single-products">
                <div class="productinfo text-center">
                    <img src="'.$row["image"].'" alt="" height=200 width=200/>
                    <h2>$'.$row["price"].'</h2>
                    <p>'.$row["name"].'</p>
                    <a href="#" class="btn btn-default add-to-cart"><i
                            class="fa fa-shopping-cart"></i>Add to cart</a>
                </div>
                <a href="product-details.php?id='.$row["id"].'"><div class="product-overlay">
                    <div class="overlay-content">
                        <h2>$'.$row["price"].'</h2>
                        <p>'.$row["description"].'</p>
                        <a href="index.php?username='.$uname.'&id='.$row["id"].'" class="btn btn-default add-to-cart"><i
                                class="fa fa-shopping-cart"></i>Add to cart</a>
                    </div>
                </div></a>
            </div>
            <div class="choose">
                <ul class="nav nav-pills nav-justified">
                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                    <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                </ul>
            </div>
        </div>
    </div></span></a>';
    }
}


  


$con->close();
?>