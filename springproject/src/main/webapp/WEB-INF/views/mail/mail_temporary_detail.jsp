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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="resources/js/mailbox.js"></script>
<script type="text/javaScript">
	function closeInsert(){  
		window.close();
	}
</script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>temporary detail</title>
</head>
<body>
	<form method="post" action="temporaryUpdate" id="temporary_detail" name="temporary_detail"
		enctype="multipart/form-data">
		<div class="container-fluid">
			<input type="hidden" id="m_seq" name="m_seq" value="${emailbox.m_seq}">
			<input type="hidden" id="m_temporary" name="m_temporary" value="${emailbox.m_temporary}">
			<div class="row">
				<div class="col-sm-12" style="text-align: center">
					
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-at">From E-Mail</i>
							</button>
						</div>
						<input type="email" name="m_fromemail" id="m_fromemail"
							class="form-control" value="${emailbox.m_fromemail }" >
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-user">보낸사람</i>
							</button>
						</div>
						<input type="text" name="m_fromname" id="m_fromname" class="form-control"
							value="${emailbox.m_fromname }" data-required="true" >
						</div>
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-at">To email</i>
							</button>
						</div>
						<input type="email" name="m_toemail" id="m_toemail"
							class="form-control" value="${emailbox.m_toemail}" >
							<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-user">받는사람</i>
							</button>
						</div>
						<input type="text" name="m_toname" id="m_toname" class="form-control"
							value="${emailbox.m_toname }" data-required="true" >
						</div>
						<div class="input-group mb-3 input-group-sm">
							<div class="input-group-prepend">
								<button class="btn btn-secondary" disabled type="button"
								style="width: 116px"><i
									class="fas fa-globe-americas">참조</i></button>
							</div>
							<input type="email" name="m_cc" id="m_cc" value="${emailbox.m_cc }"
								placeholder="참조" class="form-control" data-required="true">
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
							value="${emailbox.m_title}" >
					</div>
					
					
					
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-paperclip"></i>첨부파일
							</button>
						</div>
						<input type="file" name="m_file" onchange="filesizeChk()"
							value="${emailbox.m_attach}" id="m_file" style="width: 80%"
							>
					</div>
					<div class="input-group mb-3 input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 116px">
								<i class="fas fa-minus-circle">파일크기</i>
							</button>
						</div>
				
						<input type="text" name="m_filesize" id="m_filesize"
							value="${emailbox.m_filesize}" style="width: 85%">
						
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
							data-parsley-errors-container="글 내용을 입력하세요!" > ${emailbox.m_content}</textarea>
					</div>
					<div class="btn-group">
					 
					   
					   
					   
						<button type="button" class="btn btn-primary" id="temporaryupdate">
							<i class="fas fa-pen-square"></i>임시메일 저장
						</button>
						
						<button type="button" class="btn btn-success" id="temporarysend">
							<i class="fas fa-reply"></i>임시메일 전송
						</button>


						<button type="button" class="btn btn-dark" id="mailtemporarydetaildel">
							<i class="fas fa-trash"></i>임시메일 삭제
						</button>
						<button type="button" class="btn btn-warning"
							onclick="closeInsert()">
							<i class="fas fa-list-alt"></i>작성 취소
						</button>


						

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
