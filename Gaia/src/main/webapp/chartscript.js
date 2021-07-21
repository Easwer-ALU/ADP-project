/*
function makeChart(players) {
var playerLabels = players.map(function(d) {return d.Name});
var weeksData = players.map(function(d) {return d.Weeks});
  var chart = new Chart('chart', {
  type: 'horizontalBar',
  data: {
    labels: playerLabels,
    datasets: [
      {
        data: weeksData
      }
    ]
  }
});
}

d3
  .csv('https://s3-us-west-2.amazonaws.com/s.cdpn.io/2814973/atp_wta.csv')
  .then(makeChart); */

var ctx = document.getElementsById("myChart");
var chart = new Chart(ctx, {
    type: 'bar',
    data: {
        datasets: [{
            type: 'line',
            yAxisID: 'temperature',
            backgroundColor: 'transparent',
            borderColor: 'rgb(255, 99, 132)',
            pointBackgroundColor: 'rgb(255, 99, 132)',
            tension: 0,
            fill: false
        }, {
            yAxisID: 'precipitation',
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
            borderColor: 'transparent'
        }]
    },
    plugins: [ChartDataSource],
    options: {
        scales: {
            yAxes: [{
                id: 'temperature',
                gridLines: {
                    drawOnChartArea: false
                }
            }, {
                id: 'precipitation',
                position: 'right',
                gridLines: {
                    drawOnChartArea: false
                }
            }]
        },
        plugins: {
            datasource: {
                url: 'sample-dataset.csv'
            }
        }
    }
});
