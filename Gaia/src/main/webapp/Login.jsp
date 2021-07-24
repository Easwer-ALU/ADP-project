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
<%
	if(session.getAttribute("username")!=null){
		response.sendRedirect("Account.jsp");
	}
	
%>
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

<div class="form" style="padding-top:100px; font-size:20px">
 	<form action="Login" method="post">
 	<div class="center">
 	<label>Username </label>
 	<input type="text" name="name" required><br><br>
 	<label>Password </label>
 	<input type="password" name="pass" required><br>
 	<div style="padding-top:10px;">
 	<button style="font-size:16px;">Login</button>&nbsp;<button style="font-size:16px;" onclick="location.href='Signup.jsp';">Sign up</button>
 	</div>
 	
 	</div>
 	</form>
 
 </div>
</body>
</html>