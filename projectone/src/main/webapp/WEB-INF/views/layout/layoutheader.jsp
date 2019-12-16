<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<a class="navbar-brand" href="index"> <img src="resources/images/itschool_logo.png" alt="Logo"
			style="width: 140px; margin-left: 10px">
		</a>
		<!--상단 nav바1 -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="index">Index</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="test1">차트2번</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="test2">차트3번</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="test3">차트4번</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="test4">차트5번</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="test5">차트6번</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="test6">차트7번</a></li>
			<li class="nav-item"><a class="nav-link" id="nav-link-item" href="mesIndex">작성시작</a></li>
		</ul>
		<!-- 상단 기능 -->
		<ul class="navbar-nav">
			<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" style="margin-left: 150px;"
				href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
					class="fas fa-bell fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
					class="fas fa-envelope fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
					class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
				</div></li>
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