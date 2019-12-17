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
			<!--인수인계,업무보고 감광성 인쇄 공정 -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-bullhorn"></i>공지사항
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" style="width: 100%">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" id="th_checkAll"
										onclick="checkAll();"></th>
									<th>No</th>
									<th>작성일</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th>No</th>
									<th>작성일</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성자</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td><input type="checkbox" name="checkRow"></td>
									<td>01</td>
									<td>2019.11.11 09:38</td>
									<td class="boardTitle">11월 11일 감광성 공정 야간 업무보고</td>
									<td>2</td>
									<td>강진숙</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<span style="float: right;"><button type="button" class="btn btn-danger">삭제</button></span>
					<span style="float: right;"><button type="button" class="btn btn-success">수정</button></span>
					<span style="float: right;"><button type="button" id="mesBoardInsertbtn" class="btn btn-primary">작성</button></span>
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->

	<content tag="local_script"> <!-- Datatable scripts for this page--> <script
		src="resources/template/js/part1/boarddatatables.js"></script> <!--Date picker  --> <script
		src="resources/template/js/part1/AttendanceDatePicker.js"></script> </content>
</body>
</html>


