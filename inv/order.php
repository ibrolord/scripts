

<?php

require_once "connect.php";
	session_start();
date_default_timezone_set('America/toronto');
$item = "";
$gtn = "";
$user = $_SESSION['username'];
$user = ucfirst($user);



$item = $_GET['item'];
$qtn = $_GET['qtn'];



	$stock = "select * from product where product_id = $item";
	$results = $mysqli->query($stock);
	
	while($row = $results->fetch_array())
	{
		$name = $row["product_name"];
		$price = $row["rate"];
		$id = $row["product_id"];
		$pqtn = $row['quantity'];
	}
	
	if ($qtn <= $pqtn) {
		$price = $price * $qtn;
		echo " $user, You have sucesfully ordered the following items:<br><br>";
		$table = "<table>
  <tr>
    <th>Item(s): </th>
    <td>$name</td>     
  </tr>
  
  <tr>
    <th>Quantity:</th>
    <td>$qtn</td>     
  </tr>
  
  <tr>
    <th>Total Amount:</th>
    <td>$price$</td>     
  </tr>
  
  
</table>";


$update = "update product set quantity = quantity - $qtn where product_id = $id";
$results = $mysqli->query($update);



echo $table;



$today = date("Y-m-d");
$orderform = "INSERT INTO orders (order_date, item, total,username,quantity) 
VALUES ('$today', '$name' , '$price','$user','$qtn')";
$results = $mysqli->query($orderform);
		echo "<a href='welcome.php'>Click here to go place another order.</a>";

		
	}
	
	else {
		
		echo "Sorry, not enought inventory instock<br>" .  "Please select anything under $pqtn<br>";
		
		echo "<a href='welcome.php'>Click here to go back.</a>";
	}
	
	?>
	
	
