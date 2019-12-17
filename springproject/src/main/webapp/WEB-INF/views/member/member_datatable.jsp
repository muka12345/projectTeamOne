<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{text-align: center;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</head>
<body>
	<form method="post" enctype="multipart/form-data" data-parsley-validate="true" action="memberSelect">
		<h1 style="margin-left: 200px; margin-top: 20px">사원관리 table</h1>
		<div style="margin-left: 800px">
			<input type="text" id="find" name="find" value="${find}">
			<button type="submit" class="btn btn-info">검색</button>
		</div>
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<span>상세사항을 보려면 이름을 눌러주세요</span>
					<table id="example" class="table table-striped table-bordered"
						cellspacing="0" width="100%">
						<thead>
							<tr>
								<td>번호</td>
								<td>이름</td>
								<td>사원번호</td>
								<td>소속부서</td>
								<td>직책</td>
								<td>보안등급</td>
								<td>E-mail</td>
								<td>내선번호</td>
								<td>수정</td>
								<td>삭제</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="members" items="${members}">
								<tr>
									<td>${members.seq}</td>
									<td>${members.name}</td>
									<td>${members.empno}</td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="depart" size="3"
											value="${members.depart}">
									</span></td>
									<td><span class="form-control"> <input type="text"
											style="border: none" name="position" size="3"
											value="${members.position}"></span></td>
									<td>${members.level}</td>
									<td>${members.email}</td>
									<td>${members.officeno}</td>
									<td><button type="button" class="btn btn-primary"
											name="btnmodify" id="btnmodify" style="margin-left: 20px">수정</button></td>
									<td><button type="button" class="btn btn-danger"
											name="btndelete" id="btndelete" style="margin-left: 20px">삭제</button></td>
									<!-- 두개 다 제이쿼리로 처리 -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-1"></div>
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