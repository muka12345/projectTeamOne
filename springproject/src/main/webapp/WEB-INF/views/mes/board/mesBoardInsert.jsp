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
			<!--게시판 작성 페이지-->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-2" id="boardHeader1">
							<i class="fas fa-pen"></i>제목
						</div>
						<div class="col-sm-8">
							<input type="text" id="boardHeader2" placeholder="제목을 입력하세요" autofocus="autofocus">
						</div>
						<div class="col-sm-2" id="boardHeader3">작성자 :</div>
					</div>
				</div>
				<div class="card-body">
					<textarea class="note" rows="16" cols="193"></textarea>
				</div>
				<div class="card-footer small text-muted">
					<span style="float: right;"><button type="button" id="mesBoardInsertbtn"
							class="btn btn-primary">완료</button></span>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->
	<content tag="local_script"> <script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</content>
</body>
</html>