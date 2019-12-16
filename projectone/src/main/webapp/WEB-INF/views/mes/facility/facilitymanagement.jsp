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

			<!--점검 입력-->
			<div class="card mb-3" style="margin-top: 15px">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-wrench"></i>점검일정
						</div>
						<div class="col-sm-9"></div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" style="width: 100%">
							<thead>
								<tr>
									<th>시작일</th>
									<th>종료일</th>
									<th>공정</th>
									<th>설비</th>
									<th>점검사유</th>
									<th>소요시간</th>
									<th>시작</th>
									<th>종료</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="facilitytd" placeholder="2019-11-18 10:22"></td>
									<td><input type="text" class="facilitytd" placeholder="2019-11-18 10:52"></td>
									<td><select class="facilitytd">
											<option selected="selected">-공정을 선택하세요-</option>
											<option>열처리</option>
											<option>포토</option>
											<option>노광</option>
											<option>감광성인쇄</option>
											<option>합지</option>
											<option>조립,본딩</option>
									</select></td>
									<td><select class="facilitytd">
											<option selected="selected">-설비를 선택하세요-</option>
											<option>IR 1호기</option>
											<option>IR 2호기</option>
											<option>IR 3호기</option>
											<option>IR 4호기</option>
									</select></td>
									<td><input type="text" class="facilitytd" placeholder="인버터 교체"></td>
									<td><label class="facilitytd" >0:30</label></td>
									<td><button type="button" class="btn btn-primary" id="fstartbtn">시작</button></td>
									<td><button type="button" class="btn btn-danger" id="fendbtn">종료</button></td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					
				</div>
			</div>

			<!--점검 리스트-->
			<div class="card mb-3" style="margin-top: 15px">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-columns"></i>일정 리스트
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="excelExport"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="facilitytable" style="width: 100%">
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" id="th_checkAll"
										onclick="checkAll();"></th>
									<th>시작일</th>
									<th>종료일</th>
									<th>공정</th>
									<th>설비</th>
									<th>점검사유</th>
									<th>소요시간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="checkRow"></td>
									<td>2019-11-18 10:22
									<td>2019-11-18 10:52</td>
									<td>열처리</td>
									<td>IR 1호기</td>
									<td>인버터 교체</td>
									<td>0:30</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="card-footer small text-muted">
					<button type="button" class="btn btn-danger" style="float: right;">삭제</button>
					<button type="button" class="btn btn-success" style="float: right;">수정</button>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->

	<content tag="local_script"> <!-- Datatable scripts for this page--> <script
		src="resources/template/js/part1/facility.js"></script></content>
</body>
</html>


