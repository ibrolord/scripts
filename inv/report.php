<?php

	//connection to DB
	require("connect.php");
	date_default_timezone_set('America/toronto');

	
$name = "";
$time = "";
$today = date("Y-m-d");
$name = $_POST['users'];
$time = $_POST['time'];
	
	if ($time == "d"){
	$h = "Daily";
	$h1 = "report for $today";
	$past = date('y-m-d');
	};
	
	if ($time == "m"){
		$today = date('Y-m-t');
		$past = date('Y-m-01');
		$h = "Monthly";
		$h1 = "Report between $past and $today";
		
	};
	
	if ($time == "y"){
		$past = date('Y-m-d', strtotime('-1 year'));
			
		$h = "Yearly" ;
		$h1 = "Report between $past and $today";
		
	};
	
	
$report = "SELECT * from orders where username = '$name' and order_date between '$past' and '$today' ";
$results = $mysqli->query($report);
	
echo "<h1> $h Levels </h1>";
echo "$h1";
echo "<table border='1'>";
echo "<tr><th>Date</th>";
echo "<th>Item</th>";
echo "<th>Quantity</th>";
echo "<th>Total</th></tr>";















	while($row = $results->fetch_array()){
		$name2 = $row["item"];
		$price = $row["total"];		
		$pqtn = $row['quantity'];
		$date = $row['order_date'];
	
	
	echo "<tr><td>";
	echo $date;
	echo "</td><td>";
	echo $name2 ;
	echo "</td><td>";
	echo $pqtn ;
	echo "</td><td>";
	echo $price ;
	echo "</td></tr>";
	
}
echo "</table>";
	
	


	echo "<br><br><br>";
	
	
	
	
	
	
	$total1 =	"select item, sum(quantity) as total from orders where username = '$name' and order_date between '$past' and '$today' group by item";

$results1 = $mysqli->query($total1);

$table1 = "<table border=1>";

	while($row = $results1->fetch_array())
	{
		$name1 = $row["item"];
		$total1 = $row["total"];
	
	

		$table1 .= "<tr>
					<td>$name1</td>
					<td>$total1</td>
					</tr>";
	}

	//close out table tag
	$table1 .= "</table>";
	
	echo $table1;
	
	?>