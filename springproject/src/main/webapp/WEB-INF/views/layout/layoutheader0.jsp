<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산정보시스템</title>
<content tag="local_css">
<style>
.navbar {
	background: white;
}

#nav-link-item {
	color: black;
	font-size: 15px;
	font-weight: bold;
	margin-left: 50px;
	word-spacing: 100;
	text-decoration: none;
}
</style>
</content>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!--상단 이미지 (Logo)+ Tag -->
		<a class="navbar-brand" href="backtoHome"> <img src="resources/images/itschool_logo.png" alt="Logo"
			style="width: 140px; margin-left: 10px">
		</a>
		<!--상단 nav바1 -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="mailboxInputForm">전자메일</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="memberInfo">회원관리</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="mesIndex">생산관리</a></li>
         	<li class="nav-item"><a class="nav-link" id="nav-link-item" href="#">일정관리</a></li>
         	<li class="nav-item"><a class="nav-link" id="nav-link-item" href="#">자료관리</a></li>
         	<li class="nav-item"><a class="nav-link" id="nav-link-item" href="#">전자결제</a></li>
         	<li class="nav-item"><a class="nav-link" id="nav-link-item" href="#">커뮤니티</a></li>
         	
		</ul>
		<!-- 상단 기능 -->
		<ul class="navbar-nav">
				<li class="nav-item" style="margin-left: 100px;">
							<c:choose>
					<c:when test="${sessionempno == null }">
						<a href="LoginForm" class="btn btn-basic pull-light"><i
							class="fab fa-invision"></i>Login</a>
					</c:when>
					<c:otherwise>
						<div class="dropdown">
							<button type="button" class="btn btn-outline-primary dropdown-toggle"
								data-toggle="dropdown">
								<img src="${sessionimage}" width="20px" height="20px"
									class="img-circle"> ${sessionname}
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="memberInfo"> <i
									class="fas fa-info" style="color: #4285F4"></i> 내정보수정
								</a> <a class="dropdown-item" href=memberpassForm><i
									class="fas fa-sign-out-alt" style="color: #4285F4"></i>비밀번호 변경</a>
								<a class="dropdown-item" href="Logout"><i
									class="fas fa-sign-out-alt" style="color: #4285F4"></i> 로그아웃</a>  <a
									class="dropdown-item" href="payCheck"><i
									class="fas fa-sign-out-alt" style="color: #4285F4"></i>급여명세서 조회</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
							</li>
		</ul>
	</nav>

	<!-- navbar2 -->
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<a class="navbar-brand mr-1" href="mesIndex"><span><img src="resources/images/research.png"
				style="width: 35px; margin-right: 10px;"></span></a> <span
			style="font-size: 15px; font-weight: bold; color: white; margin-right: 5px;">MES</span>
		<button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
	</nav>
</body>
</html>