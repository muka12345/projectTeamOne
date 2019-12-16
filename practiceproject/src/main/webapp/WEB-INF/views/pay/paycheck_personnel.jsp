<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="paycheckForm" method="post" action="payInsert">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div>
						<h3 style="text-align: center;">급여명세서 입력폼</h3>
					</div>
					<div style="margin-top: 30px">
						<span>거래계좌은행: 신한금융</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>예금주:김00</span>
						<div class="input-group input-group-lg">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">이 름</button>
							<input type="text" id="name" name="name" class="form-control"
								style="width: 10%; height: 40px" value="0">
						</div>
						<div class="input-group input-group-lg"  style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">사원번호</button>
							<input type="text" id="empno" name="empno" class="form-control"
								style="width: 10%; height: 40px" value="0">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">입사일자</button>
							<input type="text" id="yyyy" name="yyyy" class="form-control"
								style="width: 10%; height: 40px" value="0"> <input
								type="text" id="mm" name="mm" class="form-control"
								style="width: 10%; height: 40px" value="0"> <input
								type="text" id="dd" name="dd" class="form-control"
								style="width: 10%; height: 40px" value="0">

						</div>

						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">근무부서</button>
							<select id="depart" name="depart" style="width: 40%">
								<option value="생산부">생산부</option>
								<option value="개발부">개발부</option>
								<option value="영업부">영업부</option>
								<option value="관리부">관리부</option>
								<option value="인사부">인사부</option>
							</select>
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">직급</button>
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
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<div class="container" style="margin-top: 20px">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<button style="width: 100%; height: 40px;" class="btn btn-warning" disabled="disabled">
						급여지급내역 및 연차 지급내역</button>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div style="margin-top: 30px">
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">기본급</button>
							<input type="text" id="basicpay" name="basicpay" class="form-control"
								style="width: 20%; height: 40px"  value="0">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">만급비</button>
							<input type="text" id="fullattendpay" name="fullattendpay" class="form-control"
								style="width: 20%; height: 40px"  value="0">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">인센티브</button>
							<input type="text" id="incentive" name="incentive" class="form-control"
								style="width: 20%; height: 40px"  value="0">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">팀수당</button>
							<input type="text" id="teampay" name="teampay" class="form-control"
								style="width: 20%; height: 40px"  value="0">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">식대</button>
							<input type="text" id="ricepay" name="ricepay" class="form-control"
								style="width: 20%; height: 40px"  value="0">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">지원금</button>
							<input type="text" id="supportpay" name="supportpay" class="form-control"
								style="width: 20%; height: 40px"  value="0">
						</div>
					</div>
				</div>

				<div class="col-md-4" style="margin-top: 30px">
					<div>
						<button class="btn btn-info" disabled="disabled">연차 지급내역 안내</button>
					</div>
					<div class="input-group input-group-lg" style="margin-top: 5px">
						<button class="btn btn-secondary" disabled type="button"
							style="width: 40%; height: 40px">누적치</button>
						<input type="text" id="accurerest" name="accurerest" class="form-control"
							style="width: 20%; height: 40px"  value="0">
					</div>
					<div class="input-group input-group-lg" style="margin-top: 5px">
						<button class="btn btn-secondary" disabled type="button"
							style="width: 40%; height: 40px">당월사용</button>
						<input type="text" id="monthrest" name="monthrest" class="form-control"
							style="width: 20%; height: 40px"  value="0">
					</div>
					<div class="input-group input-group-lg" style="margin-top: 5px">
						<button class="btn btn-secondary" disabled type="button"
							style="width: 40%; height: 40px">이월내역</button>
						<input type="text" id="moverest" name="moverest" class="form-control"
							style="width: 20%; height: 40px" value="0">
					</div>
					<p>
						공지사항<br>개인연봉은 회사 및 개인의 기밀사항으로 고의및 타의로 유출시 인사고과에 반영되어 불이익을 받을
						수 있으니 철저히 관리 바랍니다
					</p>


				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<div class="container" style="margin-top: 20px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-6">
					<button type="reset" class="btn btn-secondary" style="width: 20%">리셋</button>
					<button type="submit" class="btn btn-primary" style="width: 20%">확인</button>
					<button type="button" class="btn btn-danger" style="width: 20%"
						onclick="location.href='backtoHome'">취소</button>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</form>
</body>
</html>