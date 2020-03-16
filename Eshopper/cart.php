<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Cart | E-Shopper</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/price-range.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
	<link rel="shortcut icon" href="images/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
	<header id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<?php
								
								include 'phoneno.php';
								echo '<li><a href=""><i class="fa fa-phone"></i>'.$mobile.'</a></li>
								<li><a href=""><i class="fa fa-envelope"></i>'.$email.'</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-facebook"></i></a></li>
								<li><a href=""><i class="fa fa-twitter"></i></a></li>
								<li><a href=""><i class="fa fa-linkedin"></i></a></li>
								<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.php?username='.$uname.'"><img src="images/home/logo.png" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									USA
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">Canada</a></li>
									<li><a href="">UK</a></li>
								</ul>
							</div>

							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									DOLLAR
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">Canadian Dollar</a></li>
									<li><a href="">Pound</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">


						
							<li><a href="cart.php?username='.$uname.'"><i class="fa fa-shopping-cart"></i> Cart</a></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->

		<!--/header-bottom-->
	</header>
	<!--/header-->

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>';
					$sum=0;
					
					$text_message='';
					$con = new mysqli($servername, $user, $pw, $db);
					if($con->connect_error)
						{
							die('Could not connect: ' . $con->connect_error);
						}
						else
						{
						   //echo "Connection established!\n";
						}
						if (isset($_GET['id'])) {
							$a=$_GET['id'];
							$sql1="DELETE FROM shoppingcart WHERE id = '$a'";
							$result1 = $con->query($sql1);
							if($result1==TRUE) {
								//echo "1";
							}
							else{
								//echo "<h1>0</h1>";
							}
						  }
						  if (isset($_GET['checkout'])){
							$b=$_GET['checkout'];


							$sql="SELECT * FROM shoppingcart WHERE username = '$uname'";
							$result = $con->query($sql);
							if ($result->num_rows > 0) {
								while($row =$result->fetch_assoc()) {
									$pid=$row["id"];
			
							$sql1="SELECT * FROM product WHERE id = '$pid'";
							$result1=$con->query($sql1);
							$row1=$result1->fetch_assoc();
							$sum+=($row1["price"]*$row["quantity"]);
							$qq=strval($row["quantity"]);
							$nn=$row1["name"];
							$text_message.="$nn x $qq \n";
								}
							

							$text_message.=strval($sum);
							$text_message.="\nShopEazy\n";
				
							
							//echo "<h1>1</h1>";


							$url = 'https://rest.nexmo.com/sms/json?' . http_build_query([
								'api_key' => 'aa5758c3',
								'api_secret' => 'EpDB9czJcaoSq0ne',
								'to' => "$mobile",
								'from' => 'Nexmo',
								'text' => "$text_message"
							]);
							
							$ch = curl_init($url);
							curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
							$response = curl_exec($ch);



							}

							$sql4="DELETE FROM shoppingcart WHERE username='$uname'";
							$result4=$con->query($sql4);
							if($result4){
								//echo $shouldsend;
								//echo "<h1>1</h1>";
							}
							else{
								//echo "<h1>0</h1>";
							}
					
						}

						  
						
						$sql="SELECT * FROM shoppingcart WHERE username = '$uname'";

	$result = $con->query($sql);
	if ($result->num_rows > 0) {
		while($row =$result->fetch_assoc()) {
			$pid=$row["id"];
			
			$sql1="SELECT * FROM product WHERE id = '$pid'";
			$result1=$con->query($sql1);
			$row1=$result1->fetch_assoc();
			$img=$row1["image"];
            echo '<tr>
			<td class="cart_product">
				<a href="product-details.php?id='.$pid.'"><img src="'.$img.'" alt="" height =200 width=200></a>
			</td>
			<td class="cart_description">
				<h4><a href="product-details.php?id='.$pid.'">'.$row1["name"].'</a></h4>
				<p>Web ID: '.$pid.'</p>
			</td>
			<td class="cart_price">
				<p>$'.$row1["price"].'</p>
			</td>
			<td class="cart_quantity">
				<div class="cart_quantity_button">
				<p>'.$row["quantity"].'</p>
					
				</div>
			</td>
			<td class="cart_total">
				<p class="cart_total_price">$'.($row1["price"]*$row["quantity"]) .'</p>
			</td>
			<td class="cart_delete">
				<a class="cart_quantity_delete" href="cart.php?username='.$uname.'&id='.$pid.'"><i class="fa fa-times"></i></a>
			</td>
		</tr>
';
$sum+=($row1["price"]*$row["quantity"]);
$text_message.=(''.$row1["name"].' x '.strval($row["quantity"]).'\n');

		}

}
//echo "<h1>$text_message</h1>";
	 
	
	else {
		//echo "0";
	}
    $con->close();

					




		echo '			</tbody>
				</table>
			</div>
		</div>
	</section>
	<!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your
					delivery cost.</p>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>$'.$sum.'</span></li>
							<li>Eco Tax <span>$2</span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>$'.($sum+2).'</span></li>
						</ul>
						
						<a class="btn btn-default check_out" href="cart.php?username='.$uname.'&checkout=true">Check Out</a>';
						?>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#do_action-->

	<footer id="footer">
		<!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>e</span>-shopper</h2>
							<p></p>
						</div>
					</div>

					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank"
								href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>

	</footer>
	<!--/Footer-->



	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>

</html>