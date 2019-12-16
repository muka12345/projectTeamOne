<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<content tag="local_script"> <script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script> <script type="text/javascript">
			google.load("visualization", "1", {
				packages : [ "corechart" ]
			});
			google.setOnLoadCallback(drawChart);
			function drawChart() {
				var data = google.visualization
						.arrayToDataTable([
								[ '월', '1차동작', '1차외관', '최종외관', '종합수율', '열처리',
										'포토', '인쇄', '합지', '본딩', '조립', '출하',
										'재고' ],
								[ '2020/05', 95.0, 98.5, 99.1, 97.0, 100000,
										100000, 100000, 100000, 100000, 100000,
										100000, 120000 ],
								[ '2020/06', 95.8, 98.6, 99.2, 97.3, 100000,
										100000, 100000, 100000, 100000, 100000,
										100000, 120000 ],
								[ '2020/07', 96.3, 98.8, 99.3, 97.5, 100000,
										100000, 100000, 100000, 100000, 100000,
										100000, 120000 ],
								[ '2020/08', 96.5, 98.9, 99.4, 97.8, 100000,
										100000, 100000, 100000, 100000, 100000,
										100000, 120000 ],
								[ '2020/09', 96.8, 98.5, 99.5, 98.0, 100000,
										100000, 100000, 100000, 100000, 100000,
										100000, 120000 ] ]);
				var options = {
					title : 'Leads',
					hAxis : {
						showTextEvery : 5
					},
					vAxes : {
						0 : {
							viewWindowMode : 'explicit',
							viewWindow : {
								max : 100,
								min : 50
							},
							gridlines : {
								color : 'transparent'
							},
						},
						1 : {
							viewWindowMode : 'explicit',
							viewWindow : {
								max : 150000,
								min : 80000
							},
							gridlines : {
								color : 'transparent'
							},
						},
					},
					series : {
						0 : {
							targetAxisIndex : 0
						},
						1 : {
							targetAxisIndex : 0
						},
						2 : {
							targetAxisIndex : 0
						},
						3 : {
							targetAxisIndex : 0
						},
						4 : {
							targetAxisIndex : 1
						},
						5 : {
							targetAxisIndex : 1
						},
						6 : {
							targetAxisIndex : 1
						},
						7 : {
							targetAxisIndex : 1
						},
						8 : {
							targetAxisIndex : 1
						},
						9 : {
							targetAxisIndex : 1
						},
						10 : {
							targetAxisIndex : 1
						},
						11 : {
							targetAxisIndex : 1
						},
						12 : {
							targetAxisIndex : 1
						},
					},
					chartArea : {
						left : 100,
						top : 100,
						width : 1000,
						height : 600
					},
				};
				var chart = new google.visualization.LineChart(document
						.getElementById('chart_id'));
				chart.draw(data, options);
			}
		</script> </content>
	<div id="chart_id" style="width: 1300px; height: 1300px;"></div>
</body>
</html>