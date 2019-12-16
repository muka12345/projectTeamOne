<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="Login" data-parsley-validate="true">
		<div class="container">
			<div class="row"
				style="margin-top: 30px; text-align: center; margin-left: 250px">
				<div style="margin-bottom: 30px">
					<div class="col-md-12">
						<h1>Login Page</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row" style="margin-top: 30px; margin-left: 200px">
				<div class="col-md-12">
					<div class="input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 50px" disabled="disabled">사원번호</button>
						<input type="text" id="empno" name="empno" maxlength="10"
							style="width: 330px; height: 50px" placeholder="사원번호" required
							data-parsley-validation-threshold="1"
							data-parsley-error-message="사원번호를 입력하세요!"
							data-parsley-errors-container="div[id='idError']">

					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 30px; margin-left: 200px">
				<div class="col-md-12" id="idError"></div>
			</div>
			<div class="row" style="margin-top: 30px; margin-left: 200px">
				<div class="col-md-12">
					<div class="input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 50px" disabled="disabled">PASSWORD</button>
						<input type="password" id="password" name="password"
						    style="width: 330px; height: 50px"
							maxlength="10" placeholder="비밀번호" required
							data-parsley-validation-threshold="1"
							data-parsley-error-message="비밀번호를 입력하세요!"
							data-parsley-errors-container="div[id='passwordError']">
					</div>
					<div id="passwordError"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 30px; margin-left: 200px">
				<div class="col-md-12" id="passwordError"></div>
			</div>
			<div class="row" style="margin-top: 30px; margin-left: 200px">
				<div class="col-md-3">
					<a data-toggle="modal" href="#commonmodal"><span>비밀번호 찾기</span></a>

				</div>
				<div class="col-md-9"></div>
			</div>
			<div class="row" style="margin-top: 40px; margin-left: 180px">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<button type="submit" class="btn btn-primary">로그인</button>
					<button type="button" class="btn btn-danger"
						onclick="location.href='backtoHome'">취소</button>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<!-- The Modal -->
		<div class="modal" id="commonmodal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h3 class="modal-title">알림</h3>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<h5>비밀번호는 전산과에 연락하여주세요</h5>
						<div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="commonuse"
									data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- The Modal end -->
	</form>
</body>
</html>