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
			<!--LotNo 생성 -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-file-alt"></i>LOT 생성
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="lotCreateTable" style="width: 30%">
							<thead>
								<tr>
									<th>모델명</th>
									<th>입력</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><select name="modelcode" id="modelcode" class="selboxvermiddle">
											<option selected="selected">-모델명을 선택하세요-</option>
											<option value="itsc01">ITSC01</option>
											<option value="itsc02">ITSC02</option>
											<option value="itsc03">ITSC03</option>
											<option value="itsc04">ITSC04</option>
											<option value="itsc05">ITSC05</option>
											<option value="itsc06">ITSC06</option>
											<option value="itsc07">ITSC07</option>
											<option value="itsc08">ITSC08</option>
											<option value="itsc09">ITSC09</option>
											<option value="itsc10">ITSC10</option>
									</select></td>
									<td><button type="button" id="lotCreateBtn" class="btn btn-primary">입력</button></td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted text-center" style="height: 40px;"></div>
			</div>
		</div>
		<!-- /.container-fluid -->
		<div class="container-fluid">

			<!--LotNo 리스트 -->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-list"></i> LOT 리스트
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="excelExport"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="lotListTable" style="width: 100%">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></th>
									<th>년</th>
									<th>월</th>
									<th>일</th>
									<th>시간</th>
									<th>Lot No</th>
									<th>고객사</th>
									<th>제품군</th>
									<th>모델명</th>
									<th>규격</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th>년</th>
									<th>월</th>
									<th>일</th>
									<th>등록시간</th>
									<th>Lot No</th>
									<th>고객사</th>
									<th>제품군</th>
									<th>모델명</th>
									<th>규격</th>
								</tr>

							</tfoot>
							<tbody>
								<c:forEach items="${lotnoa}" var="lotnoa">
									<tr>
										<td><input class="lotlist" type="checkbox" id="chklot" name="checkRow"></td>
										<td>20${lotnoa.lotno.yy}년</td>
										<td>${lotnoa.lotno.mm}월</td>
										<td>${lotnoa.lotno.dd}일</td>
										<td>${lotnoa.lotno.time}</td>
										<td>${lotnoa.lotno.lotno}</td>
										<td>${lotnoa.customer.cusname}</td>
										<td>${lotnoa.product.productname}</td>
										<td>${lotnoa.model.modelname}</td>
										<td>${lotnoa.model.quantity}cell</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<span style="float: right;"><button type="button" id="lotDelteBtn1"
							class="btn btn-danger">삭제</button></span>
				</div>
			</div>
		</div>
	</div>
	<!-- /.content-wrapper -->
	<!-- The Modal -->
	<div class="modal fade" tabindex="-1" id="commonmodal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Lot리스트</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="commonuse">확인</button>
					<button type="button" class="btn btn-danger" id="commoncancel" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!--Modal End -->

	<content tag="local_script"> <!-- Datatable scripts for this page--> <script
		src="resources/template/js/part1/lotno.js"></script></content>
</body>
</html>


