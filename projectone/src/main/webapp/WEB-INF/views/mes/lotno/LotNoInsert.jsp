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
			<form action="post" id="insertLotForm" name="insertLotForm">
				<!--LotNo 입력 -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-file-import"></i>LOT 입력
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" style="width: 100%">
								<thead>
									<tr>
										<th class="thwidthcon">LOT No.</th>
										<th class="thwidthcon">설비</th>
										<th class="thwidthcon">작업자</th>
										<th>투입시간</th>
										<th class="thwidthcon">지시수량</th>
										<th class="thwidthcon">완료수량</th>
										<th class="thwidthcon">불량수량</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><select id="lotno1" name="lotno">
												<c:forEach var="lotselect" items="${lotselect}">
													<option value="${lotselect.lotno}">${lotselect.lotno}</option>
												</c:forEach>
										</select></td>
										<td><select id="fname" name="facilityname">
												<c:forEach var="facilityselect" items="${facilityselect}">
													<option value="${facilityselect.facilityname}">${facilityselect.facilityname}</option>
												</c:forEach>
										</select></td>
										<td><select id="membername" name="membername">
												<c:forEach var="memberselect" items="${memberselect}">
													<option value="${memberselect.membername}">${memberselect.membername}</option>
												</c:forEach>
										</select></td>
										<td></td>
										<td></td>
										<td><input type="text" name="input" class="tdwidth2" placeholder="384"></td>
										<td><input type="text" name="defectsum" class="tdwidth2" placeholder="0"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<table class="table table-bordered cul" style="width: 100%;">
							<thead>
								<tr>
									<th>불량1</th>
									<th>Qty</th>
									<th>불량2</th>
									<th>Qty</th>
									<th>불량3</th>
									<th>Qty</th>
									<th>불량4</th>
									<th>Qty</th>
									<th>불량5</th>
									<th>Qty</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><select id="defect1" name="defect1">
											<c:forEach var="defectselect" items="${defectselect}">
												<option value="${defectselect.defectname}">${defectselect.defectname}</option>
											</c:forEach>
									</select></td>
									<td><input type="text" name="defectqty1" class="defect" placeholder="1"></td>
									<td><select id="defect2" name="defect2">
											<c:forEach var="defectselect" items="${defectselect}">
												<option value="${defectselect.defectname}">${defectselect.defectname}</option>
											</c:forEach>
									</select></td>
									<td><input type="text" name="defectqty2" class="defect" placeholder="1"></td>
									<td><select id="defect3"name="defect3">
											<c:forEach var="defectselect" items="${defectselect}">
												<option value="${defectselect.defectname}">${defectselect.defectname}</option>
											</c:forEach>
									</select></td>
									<td><input type="text" name="defectqty3" class="defect" placeholder="1"></td>
									<td><select id="defect4"name="defect4">
											<c:forEach var="defectselect" items="${defectselect}">
												<option value="${defectselect.defectname}">${defectselect.defectname}</option>
											</c:forEach>
									</select></td>
									<td><input type="text" name="defectqty4" class="defect" placeholder="1"></td>
									<td><select id="defect5" name="defect5">
											<c:forEach var="defectselect" items="${defectselect}">
												<option value="${defectselect.defectname}">${defectselect.defectname}</option>
											</c:forEach>
									</select></td>
									<td><input type="text" name="defectqty5" class="defect" placeholder="1"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer small text-muted">
						<span style="float: right;"><button type="button" id="lotInsertBtn1"
								class="btn btn-danger">완료</button></span>
					</div>
				</div>
			</form>
			<!--LotNo 입력 리스트 -->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-list-ol"></i>LOT 입력 리스트
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="excelExport"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="lotlisttable" style="width: 100%">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" id="th_checkAll"
										onclick="checkAll();"></th>
									<th>LOT No.</th>
									<th class="thwidthcon">설비</th>
									<th class="thwidthcon">작업자</th>
									<th>투입시간</th>
									<th>지시수량</th>
									<th>완료수량</th>
									<th>불량수량</th>
									<th>불량1</th>
									<th>Qty</th>
									<th>불량2</th>
									<th>Qty</th>
									<th>불량3</th>
									<th>Qty</th>
									<th>불량4</th>
									<th>Qty</th>
									<th>불량5</th>
									<th>Qty</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="checkRow"></td>
									<td>ST19111301</td>
									<td>박스오븐</td>
									<td>김지훈</td>
									<td>2019-11-18 02:06</td>
									<td><input type="text" class="tdwidth3" placeholder="384"></td>
									<td><input type="text" class="tdwidth3" placeholder="384"></td>
									<td><input type="text" class="tdwidth3" placeholder="0"></td>
									<td><input type="text" class="tdwidth1" placeholder="open"></td>
									<td><input type="text" class="tdwidth2" placeholder="1"></td>
									<td><input type="text" class="tdwidth1" placeholder="open"></td>
									<td><input type="text" class="tdwidth2" placeholder="1"></td>
									<td><input type="text" class="tdwidth1" placeholder="open"></td>
									<td><input type="text" class="tdwidth2" placeholder="1"></td>
									<td><input type="text" class="tdwidth1" placeholder="open"></td>
									<td><input type="text" class="tdwidth2" placeholder="1"></td>
									<td><input type="text" class="tdwidth1" placeholder="open"></td>
									<td><input type="text" class="tdwidth2" placeholder="1"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">
					<span style="float: right;"><button type="button" class="btn btn-danger">삭제</button></span>
					<span style="float: right; margin-right: 5px;"><button type="button"
							id="mesBoardInsertbtn" class="btn btn-primary">수정</button></span>
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


