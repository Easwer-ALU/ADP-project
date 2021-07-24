<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Gaia Home</title>
<link rel="stylesheet" href="css/style1.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">-->
</head>

<body >

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
  	 		<a href="clchange.jsp">Climate Change in Data</a>
  			<a href="#measures">Measures</a>
  		</th>
  		
  		<th>
  			<a href="Login.jsp">Login</a>
  		</th>
  
    </tr>
  </table>
</div>	

  
<div class="fullscreen-bg">
    <video loop muted autoplay class="fullscreen-bg__video">
        <source src="pictures/Banner.webm" type="video/webm">
        
    </video>
</div>

<table style="padding-top: 80px">
	<tr  >
		<th><img src="pictures/earthwatch.png"  width="300px" height="300px"></th>

		<th class="title_banner"> GO GREEN,<br>FOR A BETTER WORLD TOMORROW</th>
	</tr>
</table>


<div class="main">
	<h2>With a Container</h2>
  <p>The w3-container class is one of the most important W3.CSS classes.</p>
  <p>It provides correct margins, padding, alignments, and more, to most HTML elements.</p>
</div>
</body>
<!-- 
if(name != null){
	String name = request.getParameter("name");
}
else{
	String name = "Login"; 
}-->
</html>