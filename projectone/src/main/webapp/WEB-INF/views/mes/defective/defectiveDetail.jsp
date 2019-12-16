<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산정보시스템</title>
<meta name="decorator" content="null" />
<content tag="local_css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"
	rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- Custom fonts for this template-->
<link href="resources/template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- Page level plugin CSS-->
<link href="resources/template/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/template/css/sb-admin.css" rel="stylesheet">
</content>

</head>
<body>
	<div id="content-wrapper">
		<div class="container-fluid" id="container-header">
			<!--mes board list form -->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-2" id="boardHeader1">
							<i class="fas fa-trash-alt"></i>불량내역 상세조회
						</div>
						<div class="col-sm-8" id="boardHeader2">LOT 번호 : ST19111301</div>
						<div class="col-sm-2">
							<span style="float: right; height: 34px"><label id="copyall"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>공정</th>
								<th>불량수량</th>
								<th>Top1</th>
								<th>Qty</th>
								<th>Top2</th>
								<th>Qty</th>
								<th>Top3</th>
								<th>Qty</th>
								<th>Top4</th>
								<th>Qty</th>
								<th>Top5</th>
								<th>Qty</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>LOT NO.</th>
								<th>ST19111301</th>
								<th>모델명</th>
								<th>ITSC01</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>열처리</td>
								<td>2</td>
								<td>면저항이상</td>
								<td>1</td>
								<td>측정시료</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>포토</td>
								<td>0</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>감광성인쇄</td>
								<td>0</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>합지</td>
								<td>0</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>1차 동작</td>
								<td>10</td>
								<td>open</td>
								<td>8</td>
								<td>short</td>
								<td>2</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>1차 외관</td>
								<td>3</td>
								<td>이물눌림</td>
								<td>1</td>
								<td>이물</td>
								<td>1</td>
								<td>원자재</td>
								<td>1</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>3차 동작</td>
								<td>1</td>
								<td>open</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>최종외관</td>
								<td>4</td>
								<td>얼룩</td>
								<td>1</td>
								<td>이물</td>
								<td>1</td>
								<td>눌림</td>
								<td>1</td>
								<td>이물눌림</td>
								<td>1</td>
								<td>이물눌림</td>
								<td>1</td>
							</tr>
							<tr>
								<td>합계</td>
								<td>20</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-footer small text-muted">
					<div class="row">
						<div class="col-sm-4" id="mesfooter1">
							<i class="fas fa-search-plus"></i>LOT 번호 <input class="messearch" type="text"
								placeholder="ST19111301" maxlength="10">
						</div>
						<div class="col-sm-8">
							<button type="button" class="btn btn-primary">조회</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->
	<content tag="local_script"> <!--Datatable copy,excel  --> <script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="resources/template/vendor/datatables/jquery.dataTables.js"></script> <script
		src="resources/template/vendor/datatables/dataTables.bootstrap4.js"></script> <script
		src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script> <script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> <script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> <script
		src="resources/template/js/part1/defectivedatatables.js"></script> </content>
</body>
</html>