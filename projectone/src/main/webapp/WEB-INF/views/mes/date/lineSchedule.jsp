<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<content tag="local_css">
<link href='resources/packages/core/main.css' rel='stylesheet' />
<link href='resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='resources/packages/timegrid/main.css' rel='stylesheet' />
</content>
</head>
<body>
	<div id="content-wrapper">
		<div class="container-fluid">
			<!--mes board list form -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-calendar-day"></i>일정표
				</div>
				<div class="card-body">
					<div id='calendar'></div>
				</div>
				<div class="card-footer small text-muted">
					<div class="row">
						<div class="col-sm-3" id="datefooter1">
							<i class="fas fa-filter"></i>필터
							<select class="dateselect">
							<option selected="selected">-공정을 선택하세요-</option>
							<option>열처리</option>
							<option>포토</option>
							<option>노광</option>
							<option>감광성인쇄</option>
							<option>합지</option>
							<option>본딩,조립</option>
							</select>
						</div>
						<div class="col-sm-9" style="margin-top: 4px">
							<!-- Default inline 1-->
							<div class="custom-control custom-checkbox custom-control-inline">
								<input type="checkbox" class="custom-control-input" id="defaultInline1"> <label
									class="custom-control-label" for="defaultInline1">개발샘플</label>
							</div>

							<!-- Default inline 2-->
							<div class="custom-control custom-checkbox custom-control-inline">
								<input type="checkbox" class="custom-control-input" id="defaultInline2"> <label
									class="custom-control-label" for="defaultInline2">설비점검</label>
							</div>

							<!-- Default inline 3-->
							<div class="custom-control custom-checkbox custom-control-inline">
								<input type="checkbox" class="custom-control-input" id="defaultInline3"> <label
									class="custom-control-label" for="defaultInline3">기술팀 테스트</label>
							</div>

							<!-- Default inline 4-->
							<div class="custom-control custom-checkbox custom-control-inline">
								<input type="checkbox" class="custom-control-input" id="defaultInline4"> <label
									class="custom-control-label" for="defaultInline4">연구소 테스트</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->

	<content tag="local_script"> <script src='resources/packages/date.js'></script>
	<script src='resources/packages/core/main.js'></script> <script
		src='resources/packages/interaction/main.js'></script> <script
		src='resources/packages/daygrid/main.js'></script> <script
		src='resources/packages/timegrid/main.js'></script> </content>
</body>
</html>
