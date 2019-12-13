
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResultPage</title>
</head>

<body>
<form action="returnResultPage" method="post">


<div class="container">
<div class="jumbotron text-center">
  <h1>${title}</h1>
  <p> ${msg}</p>
</div>
<input type="hidden" name="rtnaction" value="${rtnaction}">
  <div class="row">
    <div class="col-sm-4">
 
     
    </div>
    <div class="col-sm-4">
    <button type="button" onclick="history.go(-1)" class="btn btn-primary">돌아가기</button>
        
    </div>
    <div class="col-sm-4">
    </div>
  </div>
</div>
</form>
</body>
</html>