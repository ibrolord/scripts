<?php
$doc = "";
	//connection to DB
	require("connect.php");
	
	//player Output SQL statement
$stock = "SELECT * from product";
	$results = $mysqli->query($stock);
	
	echo "
			<html>
<head>
<title>Breezeyob</title>
<link rel='stylesheet' type='text/css' href='../css/1490755883.css' />
<div id='wrapper'>
        <div id='headerwrap'>
        <div id='header'>
            <h1>WELCOME TO BREEZEYOB</h1>
        </div>
        </head>
<body>

	<h1> Stock Levels </h1>";

		$table = "
			<!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type='text/css'>
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
<!-- Table goes in the document BODY -->


		";

		$table .= "<table class='gridtable'>";

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
	
	
	
	
		$doc .= "
				 

				<form name='frmindex' action='report.php' method='POST'>

			
        <div id='border'>
            <h1>Generate Report</p>
             </div>
  
			Select a user: $String
					<br><br>
			  Select a time period: 
				<input type='radio' name='time' id='time' value='d'> Day
			    <input type='radio' name='time' id='time'value='m'> Month
				<input type='radio' name='time' id='time' value='y'> Year
  			
				<br>
				<input type='submit' name='btnsubmit' id='btnsubmit' value='Generate '>
				<br><br>
	  		Start Date	<input type='text' name='from' id='from' size='3'>
	  		
	  		End Date	<input type='text' name='to' id='to' size='3'>
  
			<input type='submit' name='btnsubmit2' id='btnsubmit2' value='Generatethis '>
				</body>

			
			</html>";
			
	echo $doc;
	
	
	
	$mysqli->close();
	
?>
