<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">


<title>layoutheader</title>
</head>
<body>
	

   <!--상단 nav바 -->
   <nav class="navbar navbar-expand-sm sticky-top">
   <a class="navbar-brand" href="backtoHome"> <img src="resources/images/itschool_logo.png" alt="Logo"
      style="width: 130px;">
   </a>
   
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link" href="mailboxInputForm" style="color: white;">전자메일</a></li>
         <li class="nav-item"><a class="nav-link" href="memberInfo" style="color: white;">회원관리</a></li>
         <li class="nav-item"><a class="nav-link" href="mesIndex" style="color: white;">생산관리</a></li>
         <li class="nav-item"><a class="nav-link" href="#" style="color: white;">일정관리</a></li>
         <li class="nav-item"><a class="nav-link" href="#" style="color: white;">자료관리</a></li>
         <li class="nav-item"><a class="nav-link" href="#" style="color: white;">전자결제</a></li>
         <li class="nav-item"><a class="nav-link" href="#" style="color: white;">커뮤니티</a></li>
        
						<li class="nav-item" style="margin-left: 100px;">
							<c:choose>
					<c:when test="${sessionempno == null }">
						<a href="LoginForm" class="btn btn-basic pull-light"><i
							class="fab fa-invision"></i> Login</a>
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

				
		




</body>
</html>