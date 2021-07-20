<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gaia Home</title>
<link rel="stylesheet" href="style1.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js" integrity="sha512-5vwN8yor2fFT9pgPS9p9R7AszYaNn0LkQElTXIsZFCL7ucT8zDCAqlQXDdaqgA1mZP47hdvztBMsIoFxq/FyyQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body >
	<p	>	
	 <div id="navbar">
	 <a>GreenWorld</a>
  <a href="#home">Home</a>
  <a href="#news">Climate change</a>
  <a href="#contact">Measure to take</a>
</div>
	   <%--   <iframe src="https://climate.nasa.gov/interactives/climate_time_machine" width="700" height="600" ></iframe>
    <br><br>
    <iframe src="https://climate.nasa.gov/interactives/global-ice-viewer" width="700" height="600"></iframe>
       --%>
<section>
<canvas id="myChart" width="100" height="100" ></canvas>
</section>
<script src="script.js"></script>


</body>

</html>