<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email detail</title>
</head>
<body>
	<form method="post" action="boardUpdate" name="mail_detail" id ="mail_detail"
		enctype="multipart/form-data">
		<div class="container-fluid">
			<input type="hidden" id="m_seq" name="m_seq" value="${emailbox.m_seq}">
			

			<div class="row">



				<div class="col-sm-12" style="text-align: center">
					<div class="input-group mb-3 input-group-sm">
						<h6>게시글</h6>
					</div>





					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-at">From E-Mail</i>
							</button>
						</div>
						<input type="email" name="m_fromemail" id="m_fromemail"
							class="form-control" value="${emailbox.m_fromemail }" readonly>
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-user">보낸사람</i>
							</button>
						</div>
						<input type="text" name="m_fromname" id="m_fromname" class="form-control"
							value="${emailbox.m_fromname }" data-required="true" readonly>
						</div>
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-at">To email</i>
							</button>
						</div>
						<input type="email" name="m_toemail" id="m_toemail"
							class="form-control" value="${emailbox.m_toemail}" readonly>
							<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-user">받는사람</i>
							</button>
						</div>
						<input type="text" name="m_toname" id="m_toname" class="form-control"
							value="${emailbox.m_toname }" data-required="true" readonly>
						</div>
						<div class="input-group mb-3 input-group-sm">
							<div class="input-group-prepend">
								<button class="btn btn-secondary" disabled type="button"
								style="width: 116px"><i
									class="fas fa-globe-americas">참조</i></button>
							</div>
							<input type="email" name="m_cc" id="m_cc" value="${emailbox.m_cc}"
							 class="form-control" readonly>
						</div>	
					
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-globe-americas">글제목</i>
							</button>
						</div>
						<input type="text" name="m_title" id="m_title" placeholder="title"
							class="form-control" data-required="true"
							value="${emailbox.m_title}" readonly>
					</div>
				
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-paperclip"></i>첨부파일
							</button>
						</div>
							<c:choose>
						<c:when test="${emailbox.m_filename != '0'}">		
						<a href="#" onClick="downloadEncoding('${emailbox.m_attach}'); return false;">
						${emailbox.m_filename}</a>
							</c:when>
							<c:when test="${emailbox.m_filename = '0'}">
					   		<input type="text" value="첨부파일이 없습니다." style="border:none" readonly>
					   </c:when>
							</c:choose>
					</div>
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-minus-circle">파일크기</i>
							</button>
						</div>
						<input type="text" name="m_filesize" id="m_filesize"
							value="${emailbox.m_filesize}" style="width: 85%" readonly>
					</div>
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-wifi">내용</i>
							</button>
						</div>
						<textarea id="m_content" name="m_content" placeholder="content"
							style="width: 100%; height: 400px" data-required="true"
							data-parsley-errors-container="글 내용을 입력하세요!" readonly> ${emailbox.m_content}</textarea>
					</div>
					<div class="btn-group">
					   
					   <button type="button" class="btn btn-success"
							onclick="history.go(-1)">
							<i class="fas fa-list-alt"></i>메일 목록(뒤로가기)
						</button>
						<button type="button" class="btn btn-primary" onclick="openReply('${emailbox.m_seq}')">
							<i class="fas fa-pen-square"></i>메일 답변
						</button>
						<button type="button" class="btn btn-warning"
							 onclick="openForward('${emailbox.m_seq}')">
						<i class="fas fa-reply"></i>메일 전달
						</button>			   
					  <c:choose>
					   <c:when test="${emailbox.m_delete eq 'Y'}">
					  <button type="button" class="btn btn-dark" id="maildeletedel">
							<i class="fas fa-trash"></i>완전 메일 삭제
						</button>
					   </c:when>
					   <c:otherwise>
					     <button type="button" class="btn btn-dark" id="maildetaildel">
							<i class="fas fa-trash"></i>메일 삭제
						</button>
					   </c:otherwise>
					   
					   </c:choose>


						


					

					</div>

					<div class="row">

						<div class="col-sm-12">
							<div id="emailError" style="color: #ff0000"></div>
						</div>

					</div>
					<div class="row">
						<div class="col-sm-12">
							<div id="nameError" style="color: #ff0000"></div>
						</div>
					</div>


					<div class="row">
						<div class="col-sm-12">
							<div id="passwordError" style="color: #ff0000"></div>
						</div>
					</div>

				</div>
			</div>
</div>



		<!-- The Modal -->
		<div class="modal" id="commonmodal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Modal Heading</h4>
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
