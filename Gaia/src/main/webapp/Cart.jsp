<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EarthWatch Cart</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/nav.css">
 <link rel="stylesheet" href="css/style1.css">

<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("Account.jsp");
	}
	
%>

</head>

<body style="margin-top:110px;">
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
  			<a href="Shop.jsp">Shop</a>
  		</th>
  		
  		<th>
  			<a href="Login.jsp">Account</a>
  		</th>
  
    </tr>
  </table>
</div>	
<div class="center">
	<div class="container1">
		<div class="central1">
	
	<table style=" font-size: 20px;padding:16px;">
		<tr >
			<th>Cart</th>	
		</tr>
		<tr>
			<th>Products</th>
			<th>Cost</th>
		</tr>
		<tr>
			<th>Reusable metal straws</th>
			<th>${straw}</th>
		</tr>
		<tr>
			<th>Jute bags</th>
			<th>${jute}</th>
		</tr>
		<tr>
			<th>Hemp doormat</th>
			<th>${mat}</th>
		</tr>
		<tr>
			<th>Eco detergent</th>
			<th>${deter}</th>
		</tr>
		<tr>
			<th>Bamboo Dish cloth</th>
			<th>${bamb}</th>
		</tr>
		<tr>
			<th>Compostable Trah bags</th>
			<th>${trash}</th>
		</tr>
		<tr>
			<th>Total</th>
			<th>$ ${total}</th>
		</tr>
	</table>
	</div>
	</div>
	
	<form class="conrainer" action="Order.jsp">
	<div class="central	">
	<input type="submit" value="Confirm and Checkout" class="check">
	</div>
	</form>
</body>
</html>