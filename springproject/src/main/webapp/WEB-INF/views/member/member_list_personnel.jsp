<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
</head>
<body>
	<form action="#" method="post">
		<h2>경력관리 조회(인사과용)</h2>
		<div class="container">
			<div class="row">
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
					<button type="button" onclick="location.href='backtoHome'"
						class="btn btn-danger">취소</button>
					<button type="submit" class="btn btn-primary">저장</button>
					<button type="reset" class="btn btn-secondary">리셋</button>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-5">
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px; margin-top: 5px"
							disabled="disabled">이름</button>
						<input value="${memberdetail.name}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px; margin-top: 5px"
							disabled="disabled">사원번호</button>
						<input value="${memberdetail.empno}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px; margin-top: 5px"
							disabled="disabled">부서</button>
						<input value="${memberdetail.depart}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px; margin-top: 5px"
							disabled="disabled">직급</button>
						<input value="${memberdetail.position}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
				</div>
				<div class="col-sm-5">
					<button type="button" disabled="disabled" class="btn btn-info">공지사항</button>
					<p>
						정보를 입력한뒤 제출하실 서류는 인사과에 제출하여주시기 바랍니다<br> 예)경력인증 서류: 고용보험 기록<br>
						어학능력에 능숙도 중 이상에 체크하신분은 반드시 해당 자격증을 제출하여 주시기 바랍니다
					</p>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-5">

					<h5 style="margin-bottom: 5px; margin-top: 30px">자격증 입력</h5>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 30%; height: 30px;" disabled="disabled">자격증명</button>
						<input type="text" value="${memberdetail.certificate}"
							style="width: 40%; height: 30px">
					</div>
					<div class="input-group input-group-lg" style="margin-top: 5px">
						<button type="button" class="btn btn-secondary"
							style="width: 30%; height: 30px;" disabled="disabled">주관사</button>
						<input type="text" value="${memberdetail.organizer}"
							style="width: 40%; height: 30px">
					</div>
					<div class="input-group input-group-lg" style="margin-top: 5px">
						<button type="button" class="btn btn-secondary"
							style="width: 30%; height: 30px;" disabled="disabled">자격증명</button>
						<input type="text" value="${memberdetail.certificate}"
							style="width: 40%; height: 30px">
					</div>
					<div class="input-group input-group-lg" style="margin-top: 5px">
						<button type="button" class="btn btn-secondary"
							style="width: 30%; height: 30px;" disabled="disabled">주관사</button>
						<input type="text" value="${memberdetail.organizer}"
							style="width: 40%; height: 30px">
					</div>
				</div>
				<div class="col-sm-5">
					<h5 style="margin-bottom: 5px; margin-top: 30px">외국어 입력</h5>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 120px; height: 30px" disabled="disabled">영어
							능숙도</button>
						<input type="text" value="${memberdetail.english}"
							style="margin-top: 5px; width: 40%; height: 30px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 120px; height: 30px; margin-top: 5px"
							disabled="disabled">일본어 능숙도</button>
						<input type="text" value="${memberdetail.japanese}"
							style="margin-top: 5px; width: 40%; height: 30px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 120px; height: 30px; margin-top: 5px"
							disabled="disabled">중국어 능숙도</button>
						<input type="text" value="${memberdetail.chinese}"
							style="margin-top: 5px; width: 40%; height: 30px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 120px; height: 30px; margin-top: 5px"
							disabled="disabled">기타언어</button>
						<input type="text" value="${memberdetail.otherlang}"
							style="margin-top: 5px; width: 40%; height: 30px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 120px; height: 30px; margin-top: 5px"
							disabled="disabled">능숙도</button>
					<input type="text" value="${memberdetail.otherlanglevel}"
							style="margin-top: 5px; width: 40%; height: 30px">
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row">
				<div class="col-sm-5">
					<h5 style="margin-bottom: 20px;">경력사항</h5>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px;" disabled="disabled">시작기간</button>
						<br> <input type="text"  value="${memberdetail.carstartyy}" 
							style="width: 20%; height: 30px"> <span>년</span> <input
							type="text" value="${memberdetail.carstartmm}" style="width: 20%; height: 30px;">
						<span>월 부터</span><br>
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px; margin-top: 5px"
							disabled="disabled">종료기간</button>
						<input type="text" value="${memberdetail.carfinishyy}" 
							style="width: 20%; height: 30px; margin-top: 5px"> <span>년</span>
						<input type="text" value="${memberdetail.carfinishmm}"
							style="width: 20%; height: 30px; margin-top: 5px"> <span>월
							까지</span><br>
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px; margin-top: 5px"
							disabled="disabled">근무처</button>
						<input value="${memberdetail.careeroffice}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 100px; height: 30px; margin-top: 5px"
							disabled="disabled">직업</button>
						<input  value="${memberdetail.career}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>

				</div>
				<div class="col-sm-5">
					<h5 style="margin-bottom: 10px; margin-top: 10px">학력사항</h5>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 140px; height: 30px; margin-top: 5px"
							disabled="disabled">최종학력</button>
							<input value="${memberdetail.finaledu}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 140px; height: 30px; margin-top: 5px"
							disabled="disabled">대학원명</button>
						<input value="${memberdetail.graduate}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 140px; height: 30px; margin-top: 5px"
							disabled="disabled">대학명</button>
						<input value="${memberdetail.university}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 140px; height: 30px; margin-top: 5px"
							disabled="disabled">고등학교명</button>
						<input value=""${memberdetail.highschool}"" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 140px; height: 30px; margin-top: 5px"
							disabled="disabled">중학교명</button>
						<input value="${memberdetail.middleschool}" type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
					<div class="input-group input-group-lg">
						<button type="button" class="btn btn-secondary"
							style="width: 140px; height: 30px; margin-top: 5px"
							disabled="disabled">초등학교명</button>
						<input  value="${memberdetail.elementaryschool}"  type="text"
							style="width: 50%; height: 30px; margin-top: 5px">
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</form>
</body>
</html>
