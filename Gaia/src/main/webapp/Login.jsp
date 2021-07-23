<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EarthWatch login</title>
<link rel="stylesheet" href="css/style1.css">
</head>
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
  			<a href="Login.jsp">Login</a>
  		</th>
  
    </tr>
  </table>
</div>	

 
 	<form class="log" title="Login">
 	<label>Username </label>
 	<input type="text" name="name"><br>
 	<label>Password </label>
 	<input type="password" name="pass">
 	<button action="Login">Login</button>&nbsp;<button action="signup">Sign up</button>
 	</form>
 
</body>
</html>