<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}
	
%>
<%@ page import="java.sql.*" %>
<% String url= "jdbc:mysql://localhost:3306/gaia";
String username = "root";
String password = "easwer#358"; 
String sql = "SELECT * FROM order_detail WHERE log_id = ?";
Class.forName("com.mysql.cj.jdbc.Driver");

%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
<link href="css/style1.css" rel="stylesheet">
<link rel="stylesheet" href="css/Div.css">
</head>
<body action="Retriever">
<%
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement stat = con.prepareStatement(sql);
	String id = (String)session.getAttribute("id").toString();
	stat.setString(1,id);
	
	ResultSet resultset = stat.executeQuery();%>

<script type="text/javascript">
        function redirect(){
        window.location = "/ContentServlet?action=userContents"
        }
</script>

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
  			<a href="Shop.jsp">Shop</a>
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

<div style="padding-top:10px;margin-top:110px;margin-right:25%;margin-left:25%;">
	<table style="border: 5px solid #6c91c2ff; width:100%;">
		<tr>
			<th>
				<h3 style="text-align:left;"> Account Details</h3> 
			</th>
			<th></th>
		</tr>
		<tr>
			<th style="text-align:left;">Name: ${name}<br></th>
			<th></th>
		</tr>
		
		<tr>
			<th style="text-align:left;">e-mail: ${mail}<br></th>
			<th></th>
			</tr>
		<tr>
			<th style="text-align:left;">phone number: ${phno}<br></th>
			<th></th>
		</tr>
		<tr>
			<th style="text-align:left;">address: ${add}<br>
		</th>
			<th style="padding:16px;">
				<form action="Logout">
					<input type="submit" value="Logout">
				</form>
			</th>
		</tr>
		
	</table>
	<table style="border: 5px solid #6c91c2ff; margin-top: 10px;width:100%">
		<tr>
			<th><h3>Order Details</h3></th>
		</tr>
		<tr>
			
			<th style="text-align:left;">Order no</th>
			<th>Products</th>
			<th>Order Date</th>
			<th>Amount</th>
		</tr>
		<%while(resultset.next()){ %>
		<tr>
			
			<td><%= resultset.getString("ord_id") %></td>
			<td><%= resultset.getString("prod_name") %></td>
			<td><%= resultset.getString("order_date") %></td>
			<td><%= resultset.getString("amount") %></td>
		</tr>
		<%} %>
		
	</table>
</div>
</body>
</html>