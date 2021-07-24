<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EarthWatch SignUp</title>
</head>
<link rel="stylesheet" href="css/style1.css">
<body>
<div class="navbar">
  <table>
  	<tr>
 
  		<th>
  			<img src="pictures/earthwatch.png" alt="logo" width="90px" height="90px" padding-right="50px"/>
  		</th>
  		
  		<th>	
  			&nbsp;
  		</th>
  		
  		<th>
  			<a href="Home.jsp">Home</a>
  	 		<a href="clchange.jsp">Climate Change</a>
  			<a href="#measures">Measures</a>
  		</th>
  		
  		<th>
  			<a href="Login.jsp">Account</a>
  		</th>
  
    </tr>
  </table>
</div>	

<div class="center" style="margin-top:120px;font-size:20px;">
	<form action="Signup" method="post">
		<label>Enter username: </label>
		<input type="text" placeholder="username" name="usename"required><br><br>
		<label>Enter full name: &nbsp;</label>
		<input type="text" placeholder="Name" name="Cusname" required><br><br>
		<label>Enter ph no: </label>
		<input type="tel" placeholder="Enter mobile number" name="phno" required><br><br>
		<label>Enter e-mail address:</label>
		<input type="text" placeholder="email address" name="email" required><br><br>
		<label>Enter Home Address:</label>
		<input type="text" placeholder="Address"  name="address" required><br><br>
		<label>Password</label>
		<input type="password" name="pass" required><br><br>
		<input type="submit" value="Sign Up" style="font-size:16px; width:80px;color: white; height: 36px; background-color:#415d43ff ">
	</form>
</div>

</body>
</html>