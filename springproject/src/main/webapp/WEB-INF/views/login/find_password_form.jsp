<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<decorator:getProperty property="page.local_script"/>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
 <title>SB Admin - findpassword</title>
 <content tag="local_script">
 <script type ="text/javascript">

 
 </script>
 
</content>

</head>

<body class="bg-dark">
<form id="findPasswordForm" name="findPasswordForm" action="findPasswordForm" method="post">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" name= "email" id="email" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="inputEmail"  >Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" name= "name" id="name" class="form-control" placeholder="name" required="required" autofocus="autofocus">
              <label for="inputEmail"  >name</label>
            </div>
          </div>
         <div class="row" id="spinbar"> 
         <div class="col-sm-1"></div>
          <div class="col-md-6" style="text-align:center">
             <div class="spinner-border text-warning" role="status">
               <span class="sr-only">Loading...</span>
            </div>
          </div>
      </div> 
          
      
            </div>
          </div>
          <button type="button" id="findpass" class="btn btn-primary btn-block">비번찾기</button>
        
        <div class="text-center">
				
			</div>
      </div>
      <!-- The Modal -->
			<div class="modal" id="commonmodal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">Modal Heading</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">사용 가능한 E-mail 입니다.</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="commonuse" data-dismiss="modal">사용</button>
							<button type="button" class="btn btn-danger" id="commoncancel" data-dismiss="modal">취소</button>
						</div>

					</div>
				</div>
			</div>
    
</form>
</body>
</html>