<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<content tag="local_css">
<style type="text/css">
th{
font-size: 12px;
text-align: center;
}
td {
font-size: 12px;
text-align: center;
}
.dataTables_info{
font-size: 12px;
}

.dataTables_filter label {
font-size: 12px;
}
</style>
</content>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 no-gutters">
				<h5 style="text-align: center; margin-top: 20px">전일 실적</h5>
				<table id="test-table" class="table table-hover table-sm">
					<thead class="thead-light">
						<tr>
							<th>모델</th>
							<th>1차동작</th>
							<th>1차외관</th>
							<th>최종외관</th>
							<th>종합수율</th>
							<th>열처리</th>
							<th>WIP</th>
							<th>포토</th>
							<th>WIP</th>
							<th>인쇄</th>
							<th>WIP</th>
							<th>합지</th>
							<th>WIP</th>
							<th>본딩</th>
							<th>WIP</th>
							<th>조립</th>
							<th>WIP</th>
							<th>출하</th>
							<th>재고</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>itsc01</td>
							<td>92</td>
							<td>94</td>
							<td>95</td>
							<td>94</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>itsc02</td>
							<td>92</td>
							<td>94</td>
							<td>95</td>
							<td>94</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>itsc03</td>
							<td>92</td>
							<td>94</td>
							<td>95</td>
							<td>94</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>itsc04</td>
							<td>92</td>
							<td>94</td>
							<td>95</td>
							<td>94</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>itsc05</td>
							<td>92</td>
							<td>94</td>
							<td>95</td>
							<td>94</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>itsc06</td>
							<td>92</td>
							<td>94</td>
							<td>95</td>
							<td>94</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>itsc07</td>
							<td>92</td>
							<td>94</td>
							<td>95</td>
							<td>94</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
							<td>100000</td>
							<td>1000</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row" style="margin-top: 20px">
			<div class="col-sm-12 no-gutters">
				<div class="test" id="chart_div" style="width: 1553px; height: 240px;"></div>
			</div>
		</div>
	</div>
	<content tag="local_script"> <script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script> <script type="text/javascript">
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawVisualization);
			function drawVisualization() {
				var data = google.visualization.arrayToDataTable([
						[ '월', '1차동작', '1차외관', '최종외관', '종합수율', '목표수율' ],
						[ '2020/05', 95.0, 98.5, 99.1, 97.0, 99 ],
						[ '2020/06', 95.8, 98.6, 99.2, 97.3, 99 ],
						[ '2020/07', 96.3, 98.8, 99.3, 97.5, 99 ],
						[ '2020/08', 96.5, 98.9, 99.4, 97.8, 99 ],
						[ '2020/09', 96.8, 98.5, 99.5, 98.0, 99 ] ]);
				var options = {
					title : '월별 수율',
					vAxis : {
						title : '수율'
					},
					hAxis : {
						title : '월'
					},
					seriesType : 'bars',
					series : {
						4 : {
							type : 'line'
						}
					}
				};

				var chart = new google.visualization.ComboChart(document
						.getElementById('chart_div'));
				chart.draw(data, options);
			}

			google.charts.setOnLoadCallback(drawMultSeries);
			function drawMultSeries() {
				var data = google.visualization.arrayToDataTable([
						[ '공정', '생산실적', '목표수량' ], [ '열처리', 100000, 110000 ],
						[ '포토', 90000, 110000 ], [ '인쇄', 80000, 110000 ],
						[ '합지', 99000, 110000 ], [ '조립', 77000, 110000 ],
						[ '본딩', 88000, 110000 ], [ '출하', 99000, 110000 ], ]);

				var options = {
					title : '11월생산량',
					chartArea : {
						width : '65%'
					},
					hAxis : {
						title : '생산량',
						minValue : 0
					},
					vAxis : {
						title : '월'
					}
				};

				var chart = new google.visualization.BarChart(document
						.getElementById('chart_div1'));
				chart.draw(data, options);
			}
			$(document).ready(function() {
				$('#test-table').dataTable({
					"paging" : false,
					"scrollY" : 220,
					"scrollCollapse" : true,
					"language": {
			            "zeroRecords": "데이터가 존재하지 않습니다.",
			            "info" : "조회수_START_ - _END_ (총 _TOTAL_ 개)",
			            "infoEmpty": "데이터가 존재하지 않습니다.",
			            "loadingRecords" : "로딩중...",
			            "processing" : "처리중...",
			            "search" : "검색",
			            "infoFiltered": "(전체 _MAX_ 개 중 검색결과)"
			        }
				});
			});
		</script> </content>
</body>
</html>