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
<meta charset="UTF-8">
<title>임시편지함</title>
</head>


<body>
	<form method="get" action="mailboxTemporaryForm" name="mailboxinput"
		enctype="multipart/form-data" data-parsley-validate="true">
		<div class="container" id="mailboxForm"
			style="display: table; margin-top: 5px">
			<div class="row">
				<div class="col-md-12">

					<div class="row">
						<input type="text" value="임시메일함-(${rowCount})"
							style="border: none" readonly>
					</div>
					<div class="row">
						<div class="col-md-5"
							style="display: table-cell; float: left; height: 33px;">
							<SELECT class="selectpicker" id="selectfind" name="selectfind"
								data-style="btn-primary" style="float: left; height: 33px">
								<option value="all">전체</option>
								<option value="m_toname">받은사람</option>
								<option value="m_fromname" selected>보낸사람</option>
								<option value="m_date">보낸날짜</option>
								<option value="m_title">제목</option>
							</SELECT> <input type="text" id="find" name="find" value="${find}"
								style="float: left; width: 60%; height: 33px;">
							<button type="submit" class="btn btn-info"
								style="height: 33px; float: left;">검색</button>
						</div>

						<div class="col-md-6"
							style="display: table-cell; height: 33px; float: left;">
							<div class="btn-group" style="height: 33px; float: left;">
								<button type="button" id="checkallbtn" class="btn btn-primary"
									style="float: left;">전체선택</button>
								<button type="button" id="checkoutbtn" class="btn btn-secondary"
									style="float: left;">선택해제</button>
								<button type="button" id="deleteadmin" class="btn btn-success"
									style="float: left;">임시메일삭제</button>
							</div>
						</div>
						<div class="col-md-1"
							style="display: table-cell; height: 33px; float: left;">
							<SELECT class="selectpicker" id="pageSize" name="pageSize"
								style="height: 33px">
								<option value="5" selected>5건</option>
								<option value="10">10건</option>
								<option value="15">15건</option>
							</SELECT>
						</div>
					</div>
				</div>

















				<div class="col-sm-12">






					<table id="example" name="checkboxTestTbl"
						class="table table-striped table-bordered" cellspacing="0"
						width="100%">
						<thead>
							<tr style="text-align: center; background-color: #33b5e5;">
								<th style="visibility: hidden; position: absolute"></th>
								<th><input type="checkbox" id="checkall"></th>
								<th><i class="fas fa-mail-bulk"></i></th>
								<th><i class="fas fa-exclamation"></i></th>
								<th>받은사람</th>
								<th>받은날짜</th>
								<th>메일제목</th>
								<th>파일크기</th>
								<th>첨부파일</th>

								<th style="visibility: hidden; position: absolute"></th>





							</tr>
						</thead>

						<tbody>
							<c:forEach var="emailboxs" items="${emailboxs}">


								<tr style="text-align: center">

									<td style="visibility: hidden; position: absolute">${emailboxs.m_seq}</td>
									<td class="text-middle"><input type="checkbox"
										name="mailcheckbox"></td>
									<td class="text-middle"><c:choose>
											<c:when test="${emailboxs.m_show eq 'Y'}">
												<i class="fas fa-envelope-open"></i>
											</c:when>
											<c:otherwise>
												<i class="fas fa-envelope"></i>
											</c:otherwise>
										</c:choose></td>
									<td class="text-middle">
<c:choose>
<c:when test="${emailboxs.m_save eq 'Y'}">
<a href="#" onClick="importartOff('${emailboxs.m_seq}'); return false;"><i class="fas fa-star"></i></a>
</c:when>
<c:when test="${emailboxs.m_save eq 'N'}">
<a href="#" onClick="importartOn('${emailboxs.m_seq}'); return false;" ><i class="far fa-star"></i></a>
</c:when>																			</c:choose>
</td>
									<td class="text-middle">${emailboxs.m_toname}</td>
									<td class="text-middle">${emailboxs.m_date}</td>
									<td class="text-middle"><a
										href="javascript:openTemporary('${emailboxs.m_seq}');">${emailboxs.m_title}</a></td>
									<td class="text-middle"><c:if
											test="${emailboxs.m_filesize != '0'}">${emailboxs.m_filesize}</c:if></td>
									<td class="text-middle"><c:if
											test="${emailboxs.m_attach != 'N'}">
											<a href="#"
												onClick="downloadEncoding('${emailboxs.m_attach}'); return false;">
												<i class="fas fa-paperclip"></i>
											</a>
										</c:if></td>
									<td style="visibility: hidden; position: absolute">${emailboxs.m_attach}</td>


								</tr>
							</c:forEach>



						</tbody>



					</table>
					<p>${msg}</p>
				</div>
				<div class="col-sm-12">
					<c:forEach var="page" items="${pages }">
					[<a href="mailboxTemporarySelected?page=${page}&find=${find}">${page }</a>]
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