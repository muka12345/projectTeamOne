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
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

	<!-- bs-example-navbar-collapse-1 -->

	<div id="wrapper">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav nav-pills nav-stacked" id="menu">
			<li>
			<a href="javascript:openInsert();"> <span class="fa-stack fa-lg pull-left">
			<i class="fa fa-cart-plus fa-stack-1x "></i></span>메일작성</a></li>
<!-- 				<li class="active"><a href="#"><span -->
<!-- 						class="fa-stack fa-lg pull-left"><i -->
<!-- 							class="fa fa-dashboard fa-stack-1x "></i></span></a> -->
<!-- 					<ul class="nav-pills nav-stacked" style="list-style-type: none;"> -->
						
<!-- 					</ul></li> -->
				<li><a href="#"><span class="fa-stack fa-lg pull-left"><i
							class="fa fa-flag fa-stack-1x "></i></span>편지함</a>
					<ul class="nav-pills nav-stacked" style="list-style-type: none;">
						<li class="nav-item"><a
							href="mailboxInputForm">받은메일함</a></li>
						<li class="nav-item"><a
							href="mailboxOutputForm">보낸메일함</a></li>
						<li class="nav-item"><a 
							href="mailboxTemporaryForm">임시메일함</a></li>
						<li class="nav-item"><a 
							href="mailboxSaveForm">중요메일함</a></li>
						<li class="nav-item"><a 
							href="mailboxSpamForm">스팸메일함</a></li>
							<li class="nav-item"><a 
							href="mailboxDeleteForm">삭제메일함</a></li>
					</ul></li>
				<c:if test="${sessionmemlevel le 3}">
							<li><a href="mailboxAllForm"><span class="fa-stack fa-lg pull-left"><i
							class="fa fa-youtube-play fa-stack-1x "></i></span>전체메일함</a></li>
						</c:if>
				<li><a href="javascript:openAddress();"><span
						class="fa-stack fa-lg pull-left"><i
							class="fa fa-server fa-stack-1x "></i></span>주소록</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
</body>
</html>