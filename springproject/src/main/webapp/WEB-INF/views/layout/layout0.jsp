<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title><decorator:title default="itschool" /></title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"
	rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Custom fonts for this template-->
<link href="resources/template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- Page level plugin CSS-->
<link href="resources/template/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/template/css/sb-admin.css" rel="stylesheet">
<!--google font (한글)  -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<!--Date picker  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<decorator:getProperty property="page.local_css" />
</head>
<body>
	<page:applyDecorator name="layoutheader0" />

	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="mesIndex"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a></li>

			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
				id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bullhorn"></i> <span>게시판</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="mesBoardListForm">공지사항</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">파트별 인수인계:</h6>
					<a class="dropdown-item" href="mesBoardPart1">열처리</a> <a class="dropdown-item"
						href="mesBoardPart2">포토</a> <a class="dropdown-item" href="mesBoardPart3">감광성인쇄</a>
					<a class="dropdown-item" href="mesBoardPart4">합지</a> <a class="dropdown-item"
						href="mesBoardPart5">본딩,조립</a>
				</div></li>

			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
				id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="far fa-newspaper"></i> <span>LOT관리</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">LOT 관리:</h6>
					<a class="dropdown-item" href="LotNoCreate">LOT 생성</a><a class="dropdown-item"
						href="LotNoInsert">LOT 입력</a> <a class="dropdown-item" href="LotNoInfo">LOT 번호조회</a>
				</div></li>

			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
				id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-boxes"></i> <span>생산실적</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">실적 조회:</h6>
					<a class="dropdown-item" href="performanceProduction">공정별 생산실적</a> <a
						class="dropdown-item" href="performanceModel">모델별 생산실적</a> <a class="dropdown-item"
						href="inventory">재고현황</a>
				</div></li>

			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
				id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-chart-line"></i> <span>수율관리</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">수율 조회:</h6>
					<a class="dropdown-item" href="ProductionYield">공정별 수율</a> <a class="dropdown-item"
						href="modelYield">모델별 수율</a>
				</div></li>

			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
				id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user"></i> <span>사원관리</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="workerInsert">사원등록</a> <a class="dropdown-item"
						href="workerAttendance">근태관리</a>
				</div></li>

			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
				id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-users-cog"></i> <span>설비관리</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="facilityManagement">설비점검</a>
				</div></li>

			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
				id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-calendar-plus"></i> <span>일정관리</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="lineSchedule">라인사용</a>
				</div></li>

			<li class="nav-item"><a class="nav-link" href="charts.html"> <i
					class="fas fa-fw fa-chart-area"></i> <span>Charts</span></a></li>

			<li class="nav-item"><a class="nav-link" href="tables.html"> <i
					class="fas fa-fw fa-table"></i> <span>Tables</span></a></li>
		</ul>
		<decorator:body />
		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © MyFirst Project 2019</span>
				</div>
			</div>
		</footer>
	</div>
	<!-- Scroll to Top Button-->
	<span class="scroll-to-top rounded" id="goupButton"> <i class="fas fa-angle-up"></i>
	</span>

	<!--Content End  -->

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready to end your
					current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<decorator:getProperty property="page.local_script" />
	<!-- Core plugin JavaScript-->
	<script src="resources/template/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script src="resources/template/vendor/chart.js/Chart.min.js"></script>
	<script src="resources/template/vendor/datatables/jquery.dataTables.js"></script>
	<script src="resources/template/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="resources/template/js/sb-admin.min.js"></script>
	<!--Date picker  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
	<!--Datatable copy,excel  -->
	<script src="https://cdn.datatables.net/buttons/1.6.0/js/dataTables.buttons.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
</body>
</html>