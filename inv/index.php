<?php 
require_once 'connect.php';

session_start();

if(isset($_SESSION['username'])) {
	header('location: welcome.php');	
}



if($_POST) {		

	$username = $_POST['username'];
	$password = $_POST['password'];

	if(empty($username) || empty($password)) {
		if($username == "") {
			echo "Username is required";
		} 

		if($password == "") {
			echo  "Password is required";
		}
	} else {
		$sql = "SELECT * FROM users WHERE username = '$username'";
		$result = $mysqli->query($sql);

		if($result->num_rows == 1) {
			// exists
			$mainSql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
			$mainResult = $mysqli->query($mainSql);

			if($mainResult->num_rows == 1) {
				$value = $mainResult->fetch_assoc();
				$user_id = $value['user_id'];

				// set session
				$_SESSION['username'] = $username;


				header('location: welcome.php');	
			} else{
				
				echo "Incorrect username/password combination";
			} // /else
		} else {		
			echo "Username doesnot exists";		
		} 
	} 
	
} 


?>



<html>
<head>
<title>Breezeyob</title>
<link rel="stylesheet" type="text/css" href="../css/1490755883.css" />

<body>
						
						<form  action="index.php" method="post" id="loginForm">
						 <input type="text"  id="username" name="username" placeholder="Username" autocomplete="off" />
						 <input type="password"  id="password" name="password" placeholder="Password" autocomplete="off" />
						  <button type="submit"> Sign in</button>

						</form>

</body>

</html>
