<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gaia Home</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
	<p class="titletext">Welcome to new Gaia home page</p>
	<form action="welcome" method="get">
		<label>Enter name: </label>
		<input type="text" name="firstname" />
		<input type="submit"/>
	</form>
	<p>
	<iframe src="https://climate.nasa.gov/interactives/climate_time_machine" width="900" height="700"></iframe>
	</p>
</body>
</html>