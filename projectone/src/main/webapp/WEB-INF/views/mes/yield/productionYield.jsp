<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산정보시스템</title>
</head>

<body>
	<div id="content-wrapper">
		<div class="container-fluid">

			<!--일자 선택-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-calendar-day"></i>일자선택
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-sm-3">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-hourglass-start"></i>시작</span>
								</div>
								<input type="text" class="form-control" id="AttendancedatePicker1">
							</div>
						</div>
						<div class="col-sm-3">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-hourglass-end"></i>종료</span>
								</div>
								<input type="text" class="form-control" id="AttendancedatePicker2">
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer small text-muted"></div>
			</div>

			<!--공정별 수율-->
			<div class="card mb-3" style="margin-top: 15px">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-users-cog"></i>공정별 수율
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="excelExport"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="proyield" style="width: 100%">
							<thead>
								<tr>
									<th class="thwidthcon">공정명</th>
									<th class="thwidthcon">투입수량</th>
									<th class="thwidthcon">완료수량</th>
									<th class="thwidthcon">불량수량</th>
									<th class="thwidthcon">수율(%)</th>
									<th class="thwidthcon">원자재불량(%)</th>
									<th class="thwidthcon">Top1</th>
									<th class="thwidthcon">Qty1</th>
									<th class="thwidthcon">Top2</th>
									<th class="thwidthcon">Qty2</th>
									<th class="thwidthcon">Top3</th>
									<th class="thwidthcon">Qty3</th>
									<th class="thwidthcon">Top4</th>
									<th class="thwidthcon">Qty4</th>
									<th class="thwidthcon">Top5</th>
									<th class="thwidthcon">Qty5</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1차동작</td>
									<td>384</td>
									<td>384</td>
									<td>0</td>
									<td>100%</td>
									<td>0%</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
								</tr>
								<tr>
									<td>1차외관</td>
									<td>384</td>
									<td>384</td>
									<td>0</td>
									<td>100%</td>
									<td>0%</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
								</tr>
								<tr>
									<td>최종외관</td>
									<td>384</td>
									<td>384</td>
									<td>0</td>
									<td>100%</td>
									<td>0%</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
									<td>Open</td>
									<td>2</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<button type="button" class="btn btn-primary" style="float: right;">검색</button>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->

	<content tag="local_script"> <!-- Datatable scripts for this page--> <script
		src="resources/template/js/part1/yield.js"></script><!--Date picker  --> <script
		src="resources/template/js/part1/AttendanceDatePicker.js"></script> </content>
</body>
</html>


