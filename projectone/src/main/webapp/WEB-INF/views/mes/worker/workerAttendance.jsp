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
			<!--근태관리 (입력) -->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-6" style="margin-top: 5px;">
							<i class="fas fa-calendar-check"></i> 근태관리
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="workerattendance">
							<thead>
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>직위</th>
									<th>공정</th>
									<th>결근</th>
									<th>반차</th>
									<th>조퇴</th>
									<th>지각</th>
									<th>병가</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="alists" items="${alists}">
									<tr id="alistTr">
										<td>${alists.attendance.membercode}</td>
										<td>${alists.memberinsert.membername}</td>
										<td>${alists.memberinsert.position}</td>
										<td>${alists.part.partname}</td>
										<td><input type="checkbox" value="1" id="absence"></td>
										<td><input type="checkbox" value="1" id="halfday"></td>
										<td><input type="checkbox" value="1" id="early"></td>
										<td><input type="checkbox" value="1" id="late"></td>
										<td><input type="checkbox" value="1" id="sick"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<span style="float: right;"><button type="button" class="btn btn-primary"
							id="attendanceInsert">저장</button></span>
				</div>
			</div>

			<!--근태 리스트 -->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-list-alt"></i> 근태리스트
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="excelExport1"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="workerattenlist">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" id="th_checkAll"
										onclick="checkAll();"></th>
									<th>일자</th>
									<th>사번</th>
									<th>이름</th>
									<th>직위</th>
									<th>공정</th>
									<th>결근</th>
									<th>반차</th>
									<th>조퇴</th>
									<th>지각</th>
									<th>병가</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th></th>
									<th></th>
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
								<c:forEach var="alog" items="${alog}">
									<tr>
										<td><input type="checkbox" id="chkatten" name="checkRow"></td>
										<td>${alog.attendancelog.workingday}</td>
										<td>${alog.attendancelog.membercode}</td>
										<td>${alog.memberinsert.membername}</td>
										<td>${alog.memberinsert.position}</td>
										<td>${alog.part.partname}</td>
										<td>${alog.attendancelog.absence}</td>
										<td>${alog.attendancelog.halfday}</td>
										<td>${alog.attendancelog.early}</td>
										<td>${alog.attendancelog.late}</td>
										<td>${alog.attendancelog.sick}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<div class="row" style="height: 33px">
						<div class="col-sm-3">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="date1"><i class="fas fa-hourglass-start"></i>시작</span>
								</div>
								<input type="text" class="dateinsert" id="AttendancedatePicker1">
							</div>
						</div>
						<div class="col-sm-3">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="date1"><i class="fas fa-hourglass-end"></i>종료</span>
								</div>
								<input type="text" class="dateinsert" id="AttendancedatePicker2">
							</div>
						</div>
						<div class="col-sm-6">
							<button type="button" class="btn btn-danger" id="attenListdelBtn"
								style="float: right;">삭제</button>
							<button type="button" class="btn btn-success" id="attenListBtn"
								style="float: right;">조회</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->

	<!-- The Modal -->
	<div class="modal fade" tabindex="-1" id="commonmodal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">근태관리</h4>
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
		src="resources/template/js/part1/worker.js"></script> <!--Date picker  --> <script
		src="resources/template/js/part1/AttendanceDatePicker.js"></script> </content>
</body>
</html>


