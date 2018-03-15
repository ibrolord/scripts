<?php
require('connect.php');


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
				
				echo "<p style=color:red;>Incorrect username/password combination</p>";
			} // /else
		} else {		
			echo "Username doesnot exists";		
		} 
	} 
	
} 




$htm = "

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
				
        </div>
        <div id='navigationwrap>
        <div id='navigation'>
            <p>Sign In To Start Shopping</p>
        </div>
		
						<form  action='index.php' method='post' id='loginForm'>
						Username: <input type='text'  id='username' name='username' placeholder='Username' autocomplete='off' /><br>

						Password: <input type='password'  id='password' name='password' placeholder='Password' autocomplete='off' /><br>
						  <button type='submit'> Sign in</button>

						</form>

</body>

</html>
";

echo "$htm";
?>