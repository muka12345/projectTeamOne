<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-bottom: 30px; text-align: center;">
		<h2>정보수정</h2>
	</div>
	<form action="memberInfoSave" method="post" enctype="multipart/form-data"
		data-parsley-validate="true">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-9">
					<div class="input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">사원명</button>
						<input type="text" id="name" name="name" style="width: 40%"
							value="${sessionname}" readonly="readonly">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">사번</button>
						<input type="text" style="width: 25%" id="empno" name="empno"
						value="${sessionempno}" readonly="readonly"
						>
					</div>
					<div id="empnoError" style="text-align: center;"></div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">소속부서</button>
						<input type="text" style="width: 25%" id="depart" name="depart"
						value="${sessiondepart}" readonly="readonly">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">직책</button>
						<input type="text" style="width: 25%" id="position" name="position"
						value="${sessionposition}" readonly="readonly">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">보안등급</button> 
					<input type="text" style="width: 25%" id="level" name="level"
						value="${sessionlevel}" readonly="readonly">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px"disabled="disabled">E-mail</button>
						<input type="email" style="width: 40%" value="${members.email}" id="email"
							name="email">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">주소</button>
						<input type="text" style="width: 40%"value="${members.addr}"" id="addr"
							name="addr">
						<button type="button" class="btn btn-primary disabled"
							id="searchhome" name="seachhome" style="height: 30px"
							onclick="goSearchome()">검색</button>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">상세주소</button>
						<input type="text" style="width: 40%" value="${members.addr1}" id="addr1"
							name="addr1">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">자택전화</button>
						<input type="text" style="width: 30%" value="${members.homeno}" id="homeno"
							name="homeno" onkeyup="inputTelNumber(this)"> <span>ex)012-345-6789</span>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">핸드폰</button>
						<input type="text" style="width: 30%" value="${members.phoneno}" id="phoneno"
							name="phoneno" onkeyup="inputTelNumber(this)"> <span>ex)010-1111-2222</span>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">내선번호</button>
						<input type="text" style="width: 30%" value="${members.officeno}" id="officeno"
							name="officeno" maxlength="5"> <span>ex)1234,5678</span>
					</div>
				</div>
				<button type="submit" class="btn btn-primary"
					style="margin-top: 20px; margin-left: 300px">저장</button>
				<button type="reset" class="btn btn-dark"
					style="margin-top: 20px; margin-left: 8px">reset</button>
				<button type="button" class="btn btn-danger"
					style="margin-top: 20px; margin-left: 8px" onclick="location.href='backtoHome'">cancel</button>
			</div>
		</div>
	</form>
</body>
</html>
