<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div>
						<h3 style="text-align: center;">n월 급여명세서</h3>
					</div>
					<div style="margin-top: 30px">
						<span>거래계좌은행: 신한금융</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>예금주:김00</span>
						<div class="input-group input-group-lg">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">이 름</button>
							<input type="text" id="name" name="name" value="${sessionname}"
								class="form-control" style="width: 20%; height: 40px"
								readonly="readonly">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">사원번호</button>
							<input type="text" id="empno" name="empno" class="form-control"
								value="${sessionempno}" style="width: 10%; height: 40px"
								readonly="readonly">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">근무부서</button>
							<input type="text" id="#" name="#" class="form-control"
								value="${sessiondepart}" style="width: 20%; height: 40px"
								readonly="readonly">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 20%; height: 40px">직급</button>
							<input type="text" id="#" name="#" class="form-control"
								value="${sessionposition}" style="width: 20%; height: 40px"
								readonly="readonly">
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
					<button disabled="disabled" style="width: 100%; height: 40px;"
						class="btn btn-primary">급여지급내역 및 연차 지급내역</button>
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
										style="width: 20%; height: 40px" value="${pays.basicpay}" readonly="readonly">
								</div>
							<div class="input-group input-group-lg" style="margin-top: 5px">
								<button class="btn btn-secondary" disabled type="button"
									style="width: 40%; height: 40px">만급비</button>
								<input type="text" id="fullattendpay" name="fullattendpay" class="form-control"
									style="width: 20%; height: 40px" value="${pays.fullattendpay}" readonly="readonly">
							</div>
							<div class="input-group input-group-lg" style="margin-top: 5px">
								<button class="btn btn-secondary" disabled type="button"
									style="width: 40%; height: 40px">인센티브</button>
								<input type="text" id="incentive" name="incentive" class="form-control"
									style="width: 20%; height: 40px" value="${pays.incentive}" readonly="readonly">
							</div>
							<div class="input-group input-group-lg" style="margin-top: 5px">
								<button class="btn btn-secondary" disabled type="button"
									style="width: 40%; height: 40px">팀수당</button>
								<input type="text" id="teampay" name="teampay" class="form-control"
									style="width: 20%; height: 40px" value="${pays.teampay}" readonly="readonly">
							</div>
							<div class="input-group input-group-lg" style="margin-top: 5px">
								<button class="btn btn-secondary" disabled type="button"
									style="width: 40%; height: 40px">식대</button>
								<input type="text" id="ricepay" name="ricepay" class="form-control"
									style="width: 20%; height: 40px" value="${pays.ricepay}" readonly="readonly">
							</div>
							<div class="input-group input-group-lg" style="margin-top: 5px">
								<button class="btn btn-secondary" disabled type="button"
									style="width: 40%; height: 40px">지원금</button>
								<input type="text" id="supportpay" name="supportpay" class="form-control"
									style="width: 20%; height: 40px" value="${pays.supportpay}" readonly="readonly">
							</div>
						</div>
					</div>

					<div class="col-md-4" style="margin-top: 30px" disabled="disabled">
						<div>
							<button class="btn btn-danger">연차 지급내역 안내</button>
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">누적치</button>
							<input type="text" id="accurerest" name="accurerest" class="form-control"
								style="width: 20%; height: 40px" value="${pays.accurerest}" readonly="readonly">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">당월사용</button>
							<input type="text" id="monthrest" name="monthrest" class="form-control"
								style="width: 20%; height: 40px" value="${pays.monthrest}" readonly="readonly">
						</div>
						<div class="input-group input-group-lg" style="margin-top: 5px">
							<button class="btn btn-secondary" disabled type="button"
								style="width: 40%; height: 40px">이월내역</button>
							<input type="text" id="moverest" name="moverest" class="form-control"
								style="width: 20%; height: 40px" value="${pays.moverest}" readonly="readonly">
						</div>
						<p>
							공지사항<br>개인연봉은 회사 및 개인의 기밀사항으로 고의및 타의로 유출시 인사고과에 반영되어 불이익을 받을
							수 있으니 철저히 관리 바랍니다
						</p>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<a href="backtoHome"><button type="button"
								class="btn btn-primary" style="width: 100%">확인</button></a>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
	</form>
</body>
</html>