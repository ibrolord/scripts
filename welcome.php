<?php



require_once "connect.php";
	
	

	
	
	
	
	$item = "select product_name , rate, product_id from product";
	
	$results = $mysqli->query($item);
	
	$String = "<select name='item' id='item'>";
	while($row = $results->fetch_array())
	{
		$name = $row["product_name"];
		$price = $row["rate"];
		$id = $row["product_id"];
		$String .= "<option value='$id'  required>$name $price</option>";
	}
	$String .= "</select>";
	
	$mysqli->close();
	
	
		$doc = "<!DOCTYPE html>
				<html>
					<head>
						<title>Practice Test</title>
						
			<link rel='stylesheet' type='text/css' href='../css/1490755883.css' />
<div id='wrapper'>
        <div id='headerwrap'>
        <div id='header'>
            <h1>WELCOME TO BREEZEYOB</h1>
        </div>
        </head>
        <body>
				<form name='frmindex' action='order.php' method=''>
				
            <h1>Place an Order</h1><br>
			Product and Price in $: $String <br>
					
			
			Quantity: <input type='text' name='qtn' id='qtn' size='3'  required><br>
			
			<input type='submit' name='btnsubmit' id='btnsubmit' value='Submit'>
				</body>
				
			</html>";
			
	echo $doc;
	
	
?>

