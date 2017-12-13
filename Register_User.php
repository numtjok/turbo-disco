<?php
ob_start();
session_start();
$servername = "localhost";
$username = "Admin";
$password = "OTxByTmpERZQlAFh";
$dbname = "names";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

?>
<!DOCTYPE html>
<html>
<head>
	<title>Register User</title>
</head>
<body style="background-color: #E3E5E5">
	<h1>Register User</h1>
	<!-- Samling af information -->
	<form method="post">
		Username:
		<input type="text" name="user">
		Password:
		<input type="text" name="pass">
		Full Name:
		<input type="text" name="fullname">
		Age:
		<input type="text" name="age">
		Location
		<input type="text" name="location">

		<br><br>
		<input type="submit" name="Register" value="Register">
	</form>

<?php
	if (isset($_POST['Register'])) {

	// Info bliver sadt i variabler.
		$Username=$_POST['user'];
		$Password=$_POST['pass'];
		$Fullname=$_POST['fullname'];
		$Age=$_POST['age'];
		$Location=$_POST['location'];
		//Hashing af Password
		$HashedPassword=password_hash($Password, PASSWORD_DEFAULT);
		//Variabler bliver lavet om sådan at SQL Query kan forstå dem.
		$Username=mysqli_real_escape_string($conn, $Username);
		$Fullname=mysqli_real_escape_string($conn, $Fullname);
		$Location=mysqli_real_escape_string($conn, $Location);
		$HashedPassword=mysqli_real_escape_string($conn, $HashedPassword);
		$Age=mysqli_real_escape_string($conn, $Age);
		//Tjekker om der eksistere en anden bruger med det samme brugernavn
		$result=mysqli_query($conn, "SELECT * FROM people WHERE Username='".$Username."'");
		$count=mysqli_num_rows($result);
  			if ($count>=1){
  				//Bruger Eksistere
  				header("Refresh:0");
  				echo "Try another Username Please";
  			}
  			else{
  				//Ny bruger bliver lavet
 				mysqli_query($conn,"INSERT INTO people (Username, Fullname, Location, Age, Password) VALUES ('".$Username."','".$Fullname."','".$Location."','".$Age."','".$HashedPassword."')");
 				header('Location: index.php');
  			}
  	}
?>

</body>
</html>