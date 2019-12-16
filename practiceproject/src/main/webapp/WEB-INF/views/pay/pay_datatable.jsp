<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tb1').DataTable();
	});
</script>
</head>
<body>
	<form id="pay_datatable" name="pay_datatable"
		enctype="multipart/form-data" data-parsley-validate="true"
		action="payDataselect">
		<h1 style="margin-left: 200px; margin-top: 20px">급여및연차 관리 table</h1>
		<div style="margin-left: 700px">
			<input type="text" id="grope" name="grope" value="${grope}">
			<button type="submit" class="btn btn-info">검색</button>
			<button type="button" id="updatebtn" name="updatebtn"
				class="btn btn-primary">수정</button>
			<button type="button" id="deletebtn" name="deletebtn"
				class="btn btn-danger">삭제</button>
		</div>
		<div class="container" style="margin-top: 30px" id="pay_datatable"
			name="pay_datatable">
			<div class="row">
				<div class="col-md-12" id="paytable">
					<table id="tb1" class="table table-striped table-bordered"
						cellspacing="0" width="100%">
						<thead>
							<tr>
								<td><input type="checkbox" id="checkBox" name="checkBox"
									value="checkBox"></td>
								<td>입사날짜</td>
								<td>사원번호</td>
								<td>이름</td>
								<td>소속부서</td>
								<td>직책</td>
								<td>기본급</td>
								<td>인센티브</td>
								<td>만급비</td>
								<td>팀수당</td>
								<td>식대</td>
								<td>지원금</td>
								<td>연차 누적치</td>
								<td>당월사용</td>
								<td>이월내역</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pays" items="${pays}">
								<tr>
									<td><input type="checkbox" id="sign" name="sign"
										value="sign"></td>
									<td>${pays.yyyy}-${pays.mm}-${pays.dd}</td>
									<td>${pays.empno}</td>
									<td>${pays.name}</td>
									<td>${pays.depart}</td>
									<td>${pays.position}</td>
									<td>${pays.basicpay}</td>
									<td>${pays.incentive}</td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="fullattendpay" size="5"
											value="${pays.fullattendpay}"></span></td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="teampay" size="5"
											value="${pays.teampay}"></span></td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="ricepay" size="5"
											value="${pays.ricepay}"></span></td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="ricepay" size="5"
											value="${pays.supportpay}"></span></td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="accurerest" size="2"
											value="${pays.accurerest}"></span></td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="monthrest" size="2"
											value="${pays.monthrest}"></span></td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="moverest" size="2"
											value="${pays.moverest}"></span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-5" id="memoForm"></div>
				<div class="col-md-7"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-5" id="memotwoForm"></div>
				<div class="col-md-7"></div>
			</div>
		</div>
		<!-- The Modal -->
		<div class="modal commonmodal" id="commonmodal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="commonuse"
							data-dismiss="modal">사용</button>
						<button type="button" class="btn btn-danger" id="commoncancel"
							data-dismiss="modal">취소</button>
						<button type="button" class="close" id="commonclose"
							data-dismiss="modal">확인</button>
					</div>

				</div>
			</div>
		</div>
		<!-- The Modal end -->
	</form>
</body>
</html>