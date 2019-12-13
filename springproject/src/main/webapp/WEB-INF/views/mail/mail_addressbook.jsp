<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<head>
<content tag="local_script">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javaScript">
function is_ie() {
  if(navigator.userAgent.toLowerCase().indexOf("chrome") != -1) return false;
  if(navigator.userAgent.toLowerCase().indexOf("msie") != -1) return true;
  if(navigator.userAgent.toLowerCase().indexOf("windows nt") != -1) return true;
  return false;
}
 
function copy_to_clipboard(str) {
  if( is_ie() ) {
    window.clipboardData.setData("Text", str);
    alert("복사되었습니다.");
    return;
  }
  prompt("Ctrl+C를 눌러 복사하세요.", str);
}
</script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

</content>
<meta charset="UTF-8">
<title>주소록</title>
</head>


<body>
<form method="get" action="mailAddressBook" name="mailboxAll"
		enctype="multipart/form-data" data-parsley-validate="true">
	<div class="container" id="mailboxForm"
			style="display: table; margin-top: 5px">
			<div class="row">
				<div class="col-md-12">

					<div class="row">
						<input type="text" value="주소록"
							style="border: none" readonly>
					</div>
					<div class="row">
						<div class="col-md-5"
							style="display: table-cell; float: left; height: 33px;">
							<SELECT class="selectpicker" id="selectfind" name="selectfind"
								data-style="btn-primary" style="float: left; height: 33px">
								<option value="all">전체</option>
								<option value="depart">부서</option>
								<option value="name" selected>이름</option>
								<option value="position">직책</option>
								<option value="officeno">내선</option>
								<option value="phoneno">휴대폰</option>
								<option value="email">이메일</option>
							</SELECT> 
							<input type="text" id="find" name="find" value="${find}"
								style="float: left; width: 70%; height: 33px;">
		
						</div>
						<div class="col-md-7">
							<button type="submit" class="btn btn-info"
								style="height: 33px; float: left;">검색</button>
						</div>
					</div>
					</div>
					
				
			

















			<div class="col-sm-12">
				<table id="example" name="checkboxTestTbl"
					class="table table-striped table-bordered" cellspacing="0"
					width="100%">
					<thead>
						<tr style="text-align: center; background-color: #33b5e5;">
							<th>부서</th>
							<th>이름</th>
							<th>직책명</th>
							<th>내선</th>
							<th>휴대폰</th>
							<th>E-MAIL</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="members" items="${members}">
							<tr style="text-align: center">
								<td class="text-middle">${members.depart}</td>
								<td class="text-middle">${members.name}</td>
								<td class="text-middle">${members.position}</td>
								<td class="text-middle">${members.officeno}</td>
								<td class="text-middle">${members.phoneno}</td>
								<td class="text-middle"><a href="#" onClick="copy_to_clipboard('${members.email}'); return false;">${members.email}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p>${msg}</p>
			</div>
			<div class="col-sm-12">
				<c:forEach var="page" items="${pages }">
					[<a href="mailAddressBookSelected?page=${page}&find=${find}">${page }</a>]
					</c:forEach>
			</div>
		</div>
</div>
		<!-- The Modal -->
		<div class="modal" id="commonmodal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">알림</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">사용 가능한 E-mail 입니다.</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="commonuse"
							data-dismiss="modal">사용</button>
						<button type="button" class="btn btn-danger" id="commoncancel"
							data-dismiss="modal">취소</button>

					</div>

				</div>
			</div>
		</div>








	</form>
</body>
</html>