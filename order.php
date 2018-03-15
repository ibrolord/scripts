

<?php

$table = "<html>
					<head>
						<title>Practice Test</title>
						
			<link rel='stylesheet' type='text/css' href='../css/1490755883.css' />
<div id='wrapper'>
        <div id='headerwrap'>
        <div id='header'>
            <h1>WELCOME TO BREEZEYOB</h1>
        </div>

<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js'></script>
<script> 
$(document).ready(function(){
    $('button').click(function(){
        $('div').animate({left: '250px'});
    });
});
</script> 

        </head>
";

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
		echo "<div id='leftcolumn'> <b>$user, You have sucesfully ordered the following items:<br><br><b><div>";
		$table .= "<table>
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
		echo "<a href='welcome.php'><button>Click here to go place another order.</button></a> <a href='logout.php'>LOGOUT</a>";

		
	}
	
	else {
		
		echo "
				<div id='wrapper'>
        <div id='headerwrap'>
        <div id='header'>
            <h1>WELCOME TO BREEZEYOB</h1>
        </div>

		Sorry, not enought inventory in stock<br>" .  "Please select anything under $pqtn<br>";
		
		echo "<a href='welcome.php'><button>Click here to go back.</button></a> or <a href='logout.php'>LOGOUT</a>";
	}
	
	?>
	
	
