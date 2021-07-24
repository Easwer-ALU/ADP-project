<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>Climate change</title>

<link rel="stylesheet" href="css/chartstyle.css">
<link rel="stylesheet" href="css/style1.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.4.1/dist/chart.min.js"></script>


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
<div class="fullscreen-bg1">
    <video loop muted autoplay class="fullscreen-bg__video1">
        <source src="pictures/Cl-1.webm" type="video/webm">
        
    </video>
</div>
<h1>Global temperatures have been gradually increasing ever since the Industrial revolution. The effects of this global climate change is apparent when we analyze the data gathered over the years.</h1>
<div style="padding-bottom:20px; padding-left:20px; padding-right: 20px; background-color:white; margin-left:8px; border-radius: 10px;">
<div>
<canvas id="chart" width="200" height="500" style="padding:100px,100px,100px,100px; margin:30px,30px,30px,30px;"></canvas>
</div>
<h3 style="text-align:center;">This is a plot of mean temperatures from 1880 to 2020, showing the increase in global temperatures.</h3>
</div>
<script>

Charter();

async function Charter(){
	const data = await getData();
const ctx = document.getElementById('chart').getContext('2d');

const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: data.xs,
        datasets: [{
            label: 'Zonal annual mean temperatures in C',
            data: data.ys,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
               /* 'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)' */
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                /*'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'*/
            ],
            borderWidth: 1
        }]
    },
    options: {
    	 maintainAspectRatio: false,
        scales: {
            y: {
                beginAtZero: false,
                ticks: {
                    // Include a dollar sign in the ticks
                    callback: function(value, index, values) {
                        return value+ ' C';
                    }
                }
            }
        }
    }
});
}


		
		async function getData(){
			const xs= [];
			const ys=[];
			const response= await fetch('ZonAnn.Ts+dSST.csv');
			const data = await response.text();
				
			const table = data.split('\n').slice(1,142);
			
			table.forEach(row=>{
				const cols = row.split(',');
				const year= cols[0];
				xs.push(year);	
				const temp = cols[1];
				ys.push(parseFloat(temp)+14);
				console.log(year,temp);
			});
			return {xs,ys};
			
		}
</script>
</body>
</html>