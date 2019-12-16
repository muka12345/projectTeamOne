<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<content>
<style type="text/css">
td {
	
}
</style>
</content>
</head>
<body>
	<div style="margin-bottom: 30px">
		<h2>개인정보 입력폼(인사과용)</h2>
	</div>
	<form action="memberInsert" method="post" enctype="multipart/form-data"
		data-parsley-validate="true">
		<div class="container">
			<div class="row">
				<div class="col-md-3" style="height: auto; width: 80px;">
					<img src="resources/images/noimage.png" width="180px"
						height="150px" id="imgid" class="img-responsive img-rounded"
						style="background-color: #ffbb33;"> <input type="file"
						id="fileid" name="image" onchange="imageChange();"
						style="width: 200px">
				</div>
				<div class="col-md-9">
					<div class="input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">사원명</button>
						<input type="text" id="name" name="name" style="width: 40%"
							placeholder="이름을 입력해주세요">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">입사일자</button>
						<input type="text" id="joinyyyy" name="joinyyyy"
							style="width: 20%" maxlength="4"><span>년</span> <input
							type="text" id="joinmm" name="joinmm" style="width: 20%"
							maxlength="2"><span>월</span>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">사번</button>
						<input type="text" style="width: 25%" id="empno" name="empno"
							value="0" maxlength="10"> <input type="hidden"
							id="empnobase" value="y"> <input type="hidden"
							id="empnoExists" value="n" data-parsley-required
							data-parsley-equalto="#empnobase"
							data-parsley-error-message="사원번호 중복체크를 하세요!"
							data-parsley-errors-container="div[id='empnoError']">
						<button type="button" class="btn btn-warning btn-sm" id="btnempno"
							name="btnempno">중복검사</button>
						<!-- 제이쿼리 -->
					</div>
					<div class="input-group-lg" style="margin-top: 3px"></div>
					<div id="empnoError" style="text-align: center;"></div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">소속부서</button>
						<select id="depart" name="depart" style="width: 40%">
							<option value="생산부">생산부</option>
							<option value="개발부">개발부</option>
							<option value="영업부">영업부</option>
							<option value="관리부">관리부</option>
							<option value="인사부">인사부</option>
						</select>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">직책</button>
						<select id="position" name="position" style="width: 40%">
							<option value="사원">사원</option>
							<option value="주임">주임</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="차장">차장</option>
							<option value="부장">부장</option>
							<option value="이사">이사</option>
							<option value="상무이사">상무이사</option>
							<option value="전무이사">전무이사</option>
							<option value="부사장">부사장</option>
							<option value="사장">사장</option>
						</select>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">보안등급</button>
						<select id="level" name="level" style="width: 40%">
							<option value="1">일반</option>
							<option value="2">인사부</option>
							<option value="3">관리자</option>
						</select>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">E-mail</button>
						<input type="email" style="width: 40%" value="0" id="email"
							name="email">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">주소</button>
						<input type="text" style="width: 40%" value="0" id="addr"
							name="addr">
						<button type="button" class="btn btn-primary disabled"
							id="searchhome" name="seachhome" style="height: 30px"
							onclick="goSearchome()">검색</button>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">상세주소</button>
						<input type="text" style="width: 40%" value="0" id="addr1"
							name="addr1">
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">자택전화</button>
						<input type="text" style="width: 30%" value="0" id="homeno"
							name="homeno" onkeyup="inputTelNumber(this)" maxlength="15"> <span>ex)012-345-6789</span>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">핸드폰</button>
						<input type="text" style="width: 30%" value="0" id="phoneno"
							name="phoneno" onkeyup="inputTelNumber(this)"  maxlength="15"> <span>ex)010-1111-2222</span>
					</div>
					<div class="input-group-lg" style="margin-top: 3px">
						<button type="button" class="btn btn-secondary"
							style="width: 100px" disabled="disabled">내선번호</button>
						<input type="text" style="width: 30%" value="0" id="phoneno"
							name="phoneno" maxlength="5"> <span>ex)1234,5678</span>
					</div>
				</div>
				<button type="submit" class="btn btn-primary"
					style="margin-top: 20px; margin-left: 300px">저장</button>
				<button type="reset" class="btn btn-dark"
					style="margin-top: 20px; margin-left: 8px">reset</button>
				<button type="button" class="btn btn-danger"
					style="margin-top: 20px; margin-left: 8px">cancel</button>
				<input type="hidden" id="password" name="password" value="111"
					readonly="readonly" style="width: 20%" maxlength="3">
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
					<div class="modal-body">Modal body..</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="commonuse"
							data-dismiss="modal">사용</button>
						<button type="button" class="btn btn-danger" id="commoncancel"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- The Modal end -->
	</form>
</body>
</html>