
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="resources/js/mailbox.js"></script>
	<script type="text/javaScript">
	function closeInsert(){  
		window.close();
	}

    </script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ResultPage</title>
</head>

<body>
<form action="windowResultPage" method="post">
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
    <button type="button" onclick="closeInsert()" class="btn btn-primary">창 닫기</button>
        
    </div>
    <div class="col-sm-4">
    </div>
  </div>
</div>
</form>
</body>
</html>