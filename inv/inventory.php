<?php

	//connection to DB
	require("connect.php");
	
	//player Output SQL statement
$stock = "SELECT * from product";
	$results = $mysqli->query($stock);
	
	echo "<h1> Stock Levels </h1>";
		$table = "<table border=1>";

	while($row = $results->fetch_array())
	{
		$name = $row["product_name"];
		$price = $row["rate"];
		$id = $row["product_id"];
		$pqtn = $row['quantity'];
	

		$table .= "<tr>
					<td>$name</td>
					<td>$pqtn</td>
					</tr>";
	}

	//close out table tag
	$table .= "</table>";
	
	echo $table;

	echo "<br><br><br>";
	
	
	//----------------------------------
	
	$selecteduser = "select username, user_id from users";
	
	$results = $mysqli->query($selecteduser);
	
	$String = "<select name='users' id='users'>";
	while($row = $results->fetch_array())
	{
		$name = $row["username"];
		
		$id = $row["user_id"];
		$String .= "<option value='$name'  required>$name</option>";
	}
	$String .= "</select>";
	
	$mysqli->close();
	
	
		$doc = "<!DOCTYPE html>
				<html>
					<head>
						<title>Stock Levels</title>
					</head>
				<body>
				<form name='frmindex' action='report.php' method='POST'>
				
            <h1>Generate Report</h1><br>
			Select a user: $String
					<br><br>
			  Select a time period: 
				<input type='radio' name='time' id='time' value='d'> Day
			    <input type='radio' name='time' id='time'value='m'> Month
				<input type='radio' name='time' id='time' value='y'> Year
  
			<input type='submit' name='btnsubmit' id='btnsubmit' value='Generate '>
				</body>

			
			</html>";
			
	echo $doc;
	
	
	
	
	
?>
