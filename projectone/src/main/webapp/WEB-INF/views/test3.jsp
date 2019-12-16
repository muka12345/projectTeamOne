<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<!-- chart가 생성될 공간 -->
<body>
	<div id="bar_chart_div"></div>
	<content tag="local_script"> <script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script> <script>
		google.charts.load('41', {packages: ['bar']});
		google.charts.setOnLoadCallback(startChart);
		function startChart() {
			  var data = new google.visualization.arrayToDataTable([
			    ['Galaxy', 'Distance', 'Brightness'],
			    ['Canis Major Dwarf', 8000, 23.3],
			    ['Sagittarius Dwarf', 24000, 4.5],
			    ['Ursa Major II Dwarf', 30000, 14.3],
			    ['Lg. Magellanic Cloud', 50000, 0.9],
			    ['Bootes I', 60000, 13.1]
			  ]);

			  var options = {
			    width: 900,
			    chart: {
			      title: 'Nearby galaxies',
			      subtitle: 'distance on the left, brightness on the right'
			    },
			    series: {
			      0: {
			        axis: 'distance'
			      }, // Bind series 0 to an axis named 'distance'.
			      1: {
			        axis: 'brightness'
			      } // Bind series 1 to an axis named 'brightness'.
			    },
			    axes: {
			      y: {
			        distance: {
			          label: 'parsecs'
			        }, // Left y-axis.
			        brightness: {
			          side: 'right',
			          label: 'apparent magnitude'
			        } // Right y-axis.
			      }
			    }
			  };

			  var chart = new google.charts.Bar(document.getElementById('dual_y_div'));
			  chart.draw(data, options);
			};
		</script> </content>
	<div id="dual_y_div" style="width: 900px; height: 500px;"></div>
</body>
</html>