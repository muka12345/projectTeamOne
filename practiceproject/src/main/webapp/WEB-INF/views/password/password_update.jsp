<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="passwordChange">
		<div class="container">
			<div class="row"
				style="margin-top: 30px; text-align: center; margin-left: 250px">
				<div style="margin-bottom: 30px">
					<div class="col-md-12">
						<h1>Password Change</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row" style="margin-top: 30px; margin-left: 200px">
				<div class="col-md-12">
					<div class="input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 150px; height: 50px" disabled="disabled">새로운
							비밀번호</button>
						<input type="password" id="password" name="password"
							style="width: 330px; height: 50px" maxlength="10">
					</div>
					<div class="input-group-lg">
						<input type="hidden" id="empno" name="empno" value="${sessionempno}" maxlength="10">
					</div>
				</div>
			</div>

			<div class="row" style="margin-top: 60px; margin-left: 180px">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<button type="submit" class="btn btn-primary">변경</button>
					<button type="button" class="btn btn-danger"
						onclick="location.href='backtoHome'">취소</button>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</form>
</body>
</html>