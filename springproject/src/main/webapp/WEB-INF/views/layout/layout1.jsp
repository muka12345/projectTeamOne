<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
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

<title>memberlayout1</title>
<!--google font (한글)  -->
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/css/mycss.css" />
<link href="resources/css/layoutheader.css" rel="stylesheet"  type="text/css">
<link href="resources/css/layoutleftmenu.css" rel="stylesheet"  type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<decorator:getProperty property="page.local_css" />
</head>
<body class="main-header">
	<div class="contatiner">
		<div id="wrapper">
			<div>
				<page:applyDecorator name="layoutheader" />
			</div>
			<div class="row col-sm-12">
				<div class="col-sm-2">
					<page:applyDecorator name="layoutleftmenu1" />
				</div>
				<div class="col-sm-10" id="content" style="text-align: left;">
					<decorator:body />
				</div>
			</div>
		</div>
	</div>
<decorator:getProperty property="page.local_script" />
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script src="resources/js/mailbox.js"></script>
	<script src="resources/js/member.js"></script>
	<script src="resources/js/checkbox.js"></script>
<script src="https://kit.fontawesome.com/6d17a07b11.js"></script>

</body>
</html>