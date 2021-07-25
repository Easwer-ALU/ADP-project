<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>Climate change</title>

<link rel="stylesheet" href="css/chartstyle.css">
<link rel="stylesheet" href="css/style1.css">
<link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.4.1/dist/chart.min.js"></script>
<script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.js'></script>
<script src="https://unpkg.com/deck.gl@7.3/dist.min.js"></script>


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
  	 		<a href="clchange.jsp">Climate Change in Data</a>
  			<a href="Shop.jsp">Shop</a>
  		</th>
  		
  		<th>
  			<a href="Login.jsp">Account</a>
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
<h3 style="text-align:center;">This is a plot of mean temperatures from 1880 to 2020, showing the increase in global temperatures. move cursor over the points to observe individual data.</h3>
<h2>China, US and India emit the most carbon monoxide worldwide. Down below is a map showing carbon monoside emissions in ppm. </h2>
<div id="container" style="min-height: 600px; width:100%;padding-right:16px;padding-top:0px;margin-right:40px;border-radius:10px;"></div>
<div class="center">
<button onclick="mapper_IND()" style="padding-top:10px;
	background-color: #77bc3fff;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;">India</button>
  <button onclick="mapper_US()" style="padding-top:10px;
	background-color: #77bc3fff;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;">US</button>
  <button onclick="mapper_CHN()" style="padding-top:10px;
	background-color: #77bc3fff;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;">China</button>
</div>
<section style="height:;">
<canvas id="average-example" style="padding-top:50px; height:200px;"></canvas>
</section>
<h2>Here is a graph plotting Sea level rise from 1880 to 2014</h2>
<iframe src="https://datahub.io/core/sea-level-rise/view/0" width="100%" height="475px" ></iframe>
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

const api_url = 'https://api.v2.emissions-api.org'
    + '/api/v2/carbonmonoxide/average.json'
    + '?country=DE&begin=2019-02-01&end=2019-03-01'
window.onload = function () {
fetch(api_url)
.then(response => response.json())
.then(data => {
    let ctx = document.getElementById('average-example').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            // use start times contained in the requested data as labels
            labels: data.map(x => x.start.substring(8, 10)),
            datasets: [{
                label: 'Germany',
                backgroundColor: '#93bd20',
                // use the average values as data
                data: data.map(x => x.average),
            }]
        },

        // add a few sensible configuration options
        options: {
            scales: {
                yAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'carbon monoxide [mol/m²]'
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }],
                xAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'day'
                    }
                }]
            }
        }
    });
})
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
				
			});
			return {xs,ys};
			
		}
</script>
 
<script>
function mapper_US(){
	new deck.DeckGL({
	    container: 'container',
	    mapboxApiAccessToken: 'pk.eyJ1IjoiZWFzd2VyIiwiYSI6ImNrcmhteXp1dTBhbXYyd3B2ZHdna2hwMjAifQ.yVBCqyouorHF9sL5jWLbaw',
	    mapStyle: "mapbox://styles/mapbox/dark-v9",
	    longitude: -97,
	    latitude: 40,
	    zoom: 3,
	    pitch: 0,
	    layers: [new deck.HexagonLayer({
	        extruded: true,
	        radius: 30000,
	        data: 'https://api.v2.emissions-api.org/api/v2/carbonmonoxide/geo.json?country=US&begin=2019-05-01&end=2019-05-04',
	        dataTransform: d => d.features,
	        elevationScale: 50,
	        getColorValue: points => points.reduce((sum, point) => sum + point.properties.value, 0) / points.length,
	        getElevationValue: points => points.reduce((sum, point) => sum + point.properties.value, 0) / points.length,
	        getPosition: d => d.geometry.coordinates,
	    }),
	      
	    ]
	});
	}
	
function mapper_CHN(){
	new deck.DeckGL({
	    container: 'container',
	    mapboxApiAccessToken: 'pk.eyJ1IjoiZWFzd2VyIiwiYSI6ImNrcmhteXp1dTBhbXYyd3B2ZHdna2hwMjAifQ.yVBCqyouorHF9sL5jWLbaw',
	    mapStyle: "mapbox://styles/mapbox/dark-v9",
	    longitude: 102,
	    latitude: 36,
	    zoom: 3,
	    pitch: 0,
	    layers: [new deck.HexagonLayer({
	        extruded: true,
	        radius: 30000,
	        data: 'https://api.v2.emissions-api.org/api/v2/carbonmonoxide/geo.json?country=CHN&begin=2019-05-01&end=2019-05-04',
	        dataTransform: d => d.features,
	        elevationScale: 50,
	        getColorValue: points => points.reduce((sum, point) => sum + point.properties.value, 0) / points.length,
	        getElevationValue: points => points.reduce((sum, point) => sum + point.properties.value, 0) / points.length,
	        getPosition: d => d.geometry.coordinates,
	    }),
	      
	    ]
	});
	}
</script>
 
<script>

function mapper_IND(){
new deck.DeckGL({
    container: 'container',
    mapboxApiAccessToken: 'pk.eyJ1IjoiZWFzd2VyIiwiYSI6ImNrcmhteXp1dTBhbXYyd3B2ZHdna2hwMjAifQ.yVBCqyouorHF9sL5jWLbaw',
    mapStyle: "mapbox://styles/mapbox/dark-v9",
    longitude: 78,
    latitude: 22,
    zoom: 3.3,
    pitch: 0,
    layers: [new deck.HexagonLayer({
        extruded: true,
        radius: 30000,
        data: 'https://api.v2.emissions-api.org/api/v2/carbonmonoxide/geo.json?country=IND&begin=2019-05-01&end=2019-05-04',
        dataTransform: d => d.features,
        elevationScale: 50,
        getColorValue: points => points.reduce((sum, point) => sum + point.properties.value, 0) / points.length,
        getElevationValue: points => points.reduce((sum, point) => sum + point.properties.value, 0) / points.length,
        getPosition: d => d.geometry.coordinates,
    }),
      
    ]
});
}
</script>
</body>
</html>