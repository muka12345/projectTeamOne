<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<content tag="local_css">
<style>
.navbar {
	background: #760c0c;
}

.nav-link {
	color: white;
	font-size: nomal;
	font-weight: bold;
	font-style: Sans-Serif;
	word-spacing: 150;
	border: medium;
	border-color: white;
	margin-left: 50px;
	text-decoration: none;
}
</style>
</content>
<title>Insert title here</title>
</head>
<body>
	<form>
		<!--상단 이미지 (Logo)+ Tag -->
		<a class="navbar-brand" href="index"> <img
			src="resources/images/itschool_logo.png" alt="Logo"
			style="width: 130px;">
		</a>
		
		<div class="container-fluid">
			<!--상단 nav바 -->
			<nav class="navbar navbar-expand-sm sticky-top">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="index"
						style="color: white;"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="color: white;"></a></li>
				</ul>
			</nav>

			<div style="margin-left: 1400px">
				<c:choose>
					<c:when test="${sessionempno == null }">
						<a href="LoginForm" class="btn btn-warning pull-right"><i
							class="fab fa-invision"></i> Login</a>
					</c:when>
					<c:otherwise>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">
								<img src="${sessionimage}" width="20px" height="20px"
									class="img-circle"> ${sessionname}
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="myInfo"> <i
									class="fas fa-info" style="color: #4285F4"></i> 내정보수정
								</a> <a class="dropdown-item" href=passwordChangeForm><i
									class="fas fa-sign-out-alt" style="color: #4285F4"></i>비밀번호 변경</a>
								<a class="dropdown-item" href="Logout"><i
									class="fas fa-sign-out-alt" style="color: #4285F4"></i> 로그아웃</a> <a
									class="dropdown-item" href="workCheckForm"><i
									class="fas fa-sign-out-alt" style="color: #4285F4"></i>출퇴근체크</a> <a
									class="dropdown-item" href="payCheck"><i
									class="fas fa-sign-out-alt" style="color: #4285F4"></i>급여명세서 조회</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				$(".dropdown-toggle").dropdown();
			});
		</script>
	</form>
</body>
</html>