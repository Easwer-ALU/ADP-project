<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eco Shop</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <link href="css/nav2.css" rel="stylesheet">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

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
  			<a href="Shop.jsp">Measures</a>
  		</th>
  		
  		<th>
  			<a href="Login.jsp">Account</a>
  		</th>
  
    </tr>
  </table>
</div>	

</head>
<body style="margin-top:110px;">
<%
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}
	
%>
<!-- <p class="text-grey-darker text-xs mb-8">Responsive cards (1 / 2 / 3 cols); card footer; css flex properties for equal heights. Unsplash photos.</p> -->
<form action="Cart" method="post">
		<div class="flex flex-wrap -m-3" style="margin-top:110px; margin:auto;"> 
  
  
  <div class="w-full sm:w-1/2 md:w-1/3 flex flex-col p-3">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden flex-1 flex flex-col">
      <div class="bg-cover h-48" style="background-image: url(pictures/metalstraw.jpg);"></div>
      <div class="p-4 flex-1 flex flex-col" style="
">
        <h3 class="mb-4 text-2xl" style="color:#415d43ff">Reusable metal straws</h3>
        <div class="mb-4 text-grey-darker text-sm flex-1">
          <p>Food grade reusable stainless steel straws </p><br>
          <p style="color:#6c91c2ff">$19.9</p>
        </div>
        <label class="border-t border-grey-light pt-2 text-xs text-grey hover:text-red uppercase no-underline tracking-wide">Add to cart:</label>
        <input type="number" min="0" max="10" name="straw"value="0"name=" style="background-color:lightgrey;">
      </div>
    </div>  
  </div>
  
  <div class="w-full sm:w-1/2 md:w-1/3 flex flex-col p-3">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden flex-1 flex flex-col">
      <div class="bg-cover h-48" style="background-image: url(pictures/jute.jpg);"></div>
      <div class="p-4 flex-1 flex flex-col" style="
">
        <h3 class="mb-4 text-2xl" style="color:#415d43ff">Jute bags</h3>
        <div class="mb-4 text-grey-darker text-sm flex-1">
          <p>Durable, biodegradable alternative to plastic bags</p><br>
          <p style="color:#6c91c2ff">$23</p>
        </div>
         <label class="border-t border-grey-light pt-2 text-xs text-grey hover:text-red uppercase no-underline tracking-wide">Add to cart:</label>
        <input type="number" min="0" max="10" name="jute"value="0"name=" style="background-color:lightgrey;">
      </div>
    </div>  
  </div>
  
  <div class="w-full sm:w-1/2 md:w-1/3 flex flex-col p-3">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden flex-1 flex flex-col">
      <div class="bg-cover h-48" style="background-image: url(pictures/mat.jpg);"></div>
      <div class="p-4 flex-1 flex flex-col" style="
">
        <h3 class="mb-4 text-2xl" style="color:#415d43ff">Hemp doormat</h3>
        <div class="mb-4 text-grey-darker text-sm flex-1">
          <p>handmade, and stands up to regular use</p><br>
          <p style="color:#6c91c2ff">$73.2</p>
        </div>
         <label class="border-t border-grey-light pt-2 text-xs text-grey hover:text-red uppercase no-underline tracking-wide">Add to cart:</label>
        <input type="number" min="0" max="10" name="mat" value="0"name="style="background-color:lightgrey;">
      </div>
    </div>  
  </div>
  
  <div class="w-full sm:w-1/2 md:w-1/3 flex flex-col p-3">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden flex-1 flex flex-col">
      <div class="bg-cover h-48" style="background-image: url(pictures/detergent.jpg);"></div>
      <div class="p-4 flex-1 flex flex-col" style="
">
        <h3 class="mb-4 text-2xl" style="color:#415d43ff">Eco Detergent</h3>
        <div class="mb-4 text-grey-darker text-sm flex-1">
          <p>Free from any harmful chemicals or artificial fragrance</p><br>
           <p style="color:#6c91c2ff">$40</p>
        </div>
         <label class="border-t border-grey-light pt-2 text-xs text-grey hover:text-red uppercase no-underline tracking-wide">Add to cart:</label>
        <input type="number" min="0" max="10" name="deter" value="0"name="style="background-color:lightgrey;">
      </div>
    </div>  
  </div>
  
  <div class="w-full sm:w-1/2 md:w-1/3 flex flex-col p-3">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden flex-1 flex flex-col">
      <div class="bg-cover h-48" style="background-image: url(pictures/bamboo.jpg);"></div>
      <div class="p-4 flex-1 flex flex-col" style="
">
        <h3 class="mb-4 text-2xl" style="color:#415d43ff">Bamboo Dish cloth</h3>
        <div class="mb-4 text-grey-darker text-sm flex-1">
          <p>Super absorbent dish cloth made from naturally anti-bacterial bamboo fiber</p><br>
           <p style="color:#6c91c2ff">$45</p>
        </div>
        <label class="border-t border-grey-light pt-2 text-xs text-grey hover:text-red uppercase no-underline tracking-wide">Add to cart:</label>
        <input type="number" min="0" max="10" name="bamb" value="0"name=" style="background-color:lightgrey;">
      </div>
    </div>  
  </div>
  
  <div class="w-full sm:w-1/2 md:w-1/3 flex flex-col p-3">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden flex-1 flex flex-col">
      <div class="bg-cover h-48" style="background-image: url(pictures/trashbag.jpg);"></div>
      <div class="p-4 flex-1 flex flex-col" style="
">
        <h3 class="mb-4 text-2xl" style="color:#415d43ff">Compostable Trash bag</h3>
        <div class="mb-4 text-grey-darker text-sm flex-1">
          
          <p>Made from compostable bioplastic, perfect for compost bins</p><br>
          <p style="color:#6c91c2ff">$20</p>
        </div>
         <label class="border-t border-grey-light pt-2 text-xs text-grey hover:text-red uppercase no-underline tracking-wide">Add to cart:</label>
       <input type="number" min="0" max="10" value="0"name="trash" style="background-color:lightgrey;"> 
       
      </div>
    </div>  
  </div>	
  
    
</div>
<div>
<input type="submit" value="Checkout" class="check">
</div>
</form>
</body>
</html>