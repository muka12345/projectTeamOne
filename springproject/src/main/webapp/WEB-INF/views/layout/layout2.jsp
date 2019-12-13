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

<title>projectemail</title>
<link href="resources/css/layoutheader.css" rel="stylesheet"  type="text/css">
<link href="resources/css/layoutleftmenu.css" rel="stylesheet"  type="text/css">
<link href="resources/css/normalize.css" rel="stylesheet"  type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/toastr.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body class="main-header">
	<div class="contatiner">
		<div id="wrapper">
			<div class="row col-sm-12">
			
				<page:applyDecorator name="layoutheader" />
				<decorator:getProperty property="page.local_script"></decorator:getProperty>
			</div>
			<div class="row col-sm-12">
				<div class="col-sm-2">
					<page:applyDecorator name="layoutleftmenu2" />
				</div>
				<div class="col-sm-10" id="content" style="text-align: left;">
				
					<decorator:body />
					
				</div>
			</div>
		</div>

	</div>



	

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="resources/js/layoutleftmenu.js"></script>
	<script src="resources/js/toastr.min.js"></script>
	<script src="resources/js/mailbox.js"></script>
	
<script src="https://kit.fontawesome.com/6d17a07b11.js"></script>
	
	



</body>
</html>