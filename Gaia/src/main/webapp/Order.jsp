<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
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
  			<a href="Shop.jsp">Shop</a>
  		</th>
  		
  		<th>
  			<a href="Login.jsp">Account</a>
  		</th>
  
    </tr>
  </table>
</div>	

<div class="center" style="margin-top:120px;font-size:20px;">
	<form action="Order" method="post">
		<h4>Enter Delivery Details</h4><br>
		
		
		<label>Enter Full name: &nbsp;</label>
		<input type="text" placeholder="Name" name="delname" required><br><br>
		
		<label>Enter Delivery Address:</label>
		<input type="text" placeholder="Address"  name="deladd" list="address" required><br><br>
		<datalist id="address">
			<option>Address</option>
			<option>not address</option>
		</datalist>
		<label>Delivery option:</label>
		<select name="delivery">
			<option value="standard">Standard delivery $10</option>
			<option value="fast">Fast delivery $25</option>
		</select><br><br>
		<label>Payment method:</label>
		
		<select name="payment">
			<option value="cod">Cash on Delivery</option>
			
		</select><br><br>
		<input type="submit" value="Place Order" style="font-size:16px; width:100px;color: white; height: 36px; background-color:#415d43ff ">
	</form>
</div>
</body>
</html>