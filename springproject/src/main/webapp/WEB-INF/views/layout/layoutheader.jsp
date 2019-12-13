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


<title>layoutheader</title>
</head>
<body>
	

   <!--상단 nav바 -->
   <nav class="navbar navbar-expand-sm sticky-top">
   <a class="navbar-brand" href="index"> <img src="resources/images/itschool_logo.png" alt="Logo"
      style="width: 130px;">
   </a>
    <div class="navbar-header fixed-brand">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" id="menu-toggle">
        <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
      </button>
    </div>
      <ul class="navbar-nav">
      
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="testView" style="color: white;">테스트</a></li>
     
						<li class="nav-item">
							<c:choose>
					<c:when test="${sessionemail == null }">
						<a href="loginForm" class="btn btn-danger pull-right"><i class="fab fa-invision"></i> Login</a>
					</c:when>
					<c:otherwise>
						<div class="dropdown">
							<button type="button" class="btn btn-info dropdown-toggle"
								data-toggle="dropdown">
								<img src="${sessionimage}" width="20px" height="20px" class="img-circle"> 
								${sessionname}
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt" style="color:#4285F4"></i> 로그아웃</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
							</li>
        
         
      </ul>
   </nav>

				
		




</body>
</html>