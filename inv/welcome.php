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
						<style>
							body {
    font-family: Verdana, Arial, Helvetica, sans-serif;
    font-size: 13px;
    color:#333
}

p {
    padding: 10px;
}

#wrapper {
    margin: 0 auto;
    width: 1000px;
}

#headerwrap {
    width: 1000px;
    float: left;
    margin: 0 auto;
}

#header {
    height: 75px;
    background: #FF6633;
    border-radius: 10px;
    border: 1px solid #eb521f;
    margin: 5px;
}

#navigationwrap {
    width: 1000px;
    float: left;
    margin: 0 auto;
}

#navigation {
    height: 40px;
    background: #FFCC33;
    border-radius: 10px;
    border: 1px solid #ebb81f;
    margin: 5px;
}

#contentwrap {
    width: 850px;
    float: left;
    margin: 0 auto;
}

#content {
    background: #FFFFFF;
    border-radius: 10px;
    border: 1px solid #ebebeb;
    margin: 5px;
}

#leftcolumnwrap {
    width: 150px;
    float: left;
    margin: 0 auto;
}

#leftcolumn {
    background: #33CCFF;
    border-radius: 10px;
    border: 1px solid #1fb8eb;
    margin: 5px;
}

#footerwrap {
    width: 1000px;
    float: left;
    margin: 0 auto;
    clear: both;
}

#footer {
    height: 40px;
    background: #33FF66;

						</style>
					</head>
				
				<body>
				  <div id="wrapper">
        <div id="headerwrap">
        <div id="header">
            <p>This is the Header</p>
        </div>
        </div>
				<form name='frmindex' action='order.php' method=''>
				
            <h1>Place an Order</h1><br>
			$String
					
			
			Quantity: <input type='text' name='qtn' id='qtn' size='3'  required>
			
			<input type='submit' name='btnsubmit' id='btnsubmit' value='Submit'>
				</body>
				
			</html>";
			
	echo $doc;
	
	
?>

