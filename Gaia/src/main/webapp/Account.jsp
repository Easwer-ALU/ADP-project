<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/Div	.css">
</head>
<body action="Retriever">
<script type="text/javascript">
        function redirect(){
        window.location = "/ContentServlet?action=userContents"
        }
</script>
<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
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
  	 		<a href="clchange.jsp">Climate Change in Data</a>
  			<a href="#measures">Measures</a>
  		</th>
  		
  		<th>
  			 <a href="Retriever" id="logname">Account</a>
  			
  		</th>
  
    </tr>
  </table>
  
</div>	
<!--  
<div style="padding-top:100px;">
<div class="table">
  Table
</div>
<div class="text-container">
  <div class="text1">
    Text1
  </div>
  <div class="text2">
    Text2
  </div>
  <div class="text3">
    Text3
  </div>
  <div class="text4">
    Text4
  </div>
</div>
</div>
-->

<div style="padding-top:100px">
	<table style="border: 5px solid #6c91c2ff; ">
		<tr>
			<th>
				<h4>Account Details</h4> 
				Name: ${username}<br>
				e-mail: 
				
			</th>
			
			<th>
				<form action="Logout">
					<input type="submit" value="Logout">
				</form>
			</th>
		</tr>
	</table>
</div>
</body>
</html>