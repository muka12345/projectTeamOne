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
			<!--LotNo로 이력 조회-->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-search"></i>LOT 번호조회<span class="lotheader">(종합)</span>
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="copyall"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTablecopy" style="width: 100%">
							<thead>
								<tr>
									<th>Lot No</th>
									<th>제품군</th>
									<th>모델명</th>
									<th>년</th>
									<th>월</th>
									<th>일</th>
									<th>시간</th>
									<th>현 공정</th>
									<th>투입수량</th>
									<th>양품</th>
									<th>불량</th>
									<th>양품률(%)</th>
									<th>불량률(%)</th>
								</tr>
							</thead>
							<tbody>
								<tr class="defectivetd" id="defectiveDetailTd">
									<td>ST19111301</td>
									<td>테블릿</td>
									<td>itsc01</td>
									<td>2019년</td>
									<td>11월</td>
									<td>13일</td>
									<td>2:11 PM</td>
									<td>조립</td>
									<td>384개</td>
									<td>364개</td>
									<td>20개</td>
									<td>94.8%</td>
									<td>5.21%</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<div class="row">
						<div class="col-sm-3" id="mesfooter1">
							<i class="fas fa-search-plus"></i>LOT 번호 <input class="messearch" type="text"
								placeholder="ST19111301" maxlength="10">
						</div>
						<div class="col-sm-9">
							<button type="button" class="btn btn-primary">조회</button>
						</div>
					</div>
				</div>
			</div>

			<!--LotNo로 생산 이력 조회-->
			<div class="card mb-3" style="margin-top: 15px">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-search-plus"></i>LOT 번호조회<span class="lotheader">(생산이력)</span>
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="excelExport"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="LotNoexcel" style="width: 100%">
							<thead>
								<tr>
									<th>LOT No.</th>
									<th>모델</th>
									<th>공정</th>
									<th>지시수량</th>
									<th>투입수량</th>
									<th>완료수량</th>
									<th>불량수량</th>
									<th>시작시간</th>
									<th>종료시간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>ST19111301</td>
									<td>itsc01</td>
									<td>열처리</td>
									<td>384</td>
									<td>384</td>
									<td>384</td>
									<td>0</td>
									<td>2019-11-15 09:44</td>
									<td>2019-11-15 11:44</td>
								</tr>
								<tr>
									<td>ST19111301</td>
									<td>itsc01</td>
									<td>포토</td>
									<td>384</td>
									<td>384</td>
									<td>384</td>
									<td>0</td>
									<td>2019-11-15 13:14</td>
									<td>2019-11-15 16:44</td>
								</tr>
								<tr>
									<td>ST19111301</td>
									<td>itsc01</td>
									<td>감광성인쇄</td>
									<td>384</td>
									<td>384</td>
									<td>384</td>
									<td>0</td>
									<td>2019-11-15 17:34</td>
									<td>2019-11-15 23:54</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<div class="row">
						<div class="col-sm-3" id="mesfooter1">
							<i class="fas fa-search-plus"></i>LOT 번호 <input class="messearch" type="text"
								placeholder="ST19111301" maxlength="10">
						</div>
						<div class="col-sm-9">
							<button type="button" class="btn btn-primary">조회</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->

	<content tag="local_script"> <!-- Datatable scripts for this page--> <script
		src="resources/template/js/part1/lotno.js"></script></content>
</body>
</html>


