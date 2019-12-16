<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산정보시스템</title>
</head>
<body>
	<div id="content-wrapper">
		<div class="container-fluid">
			<!--worker insert  -->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-user"></i> 사원입력
						</div>
						<div class="col-sm-9"></div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" style="margin-top: 15px;">
							<thead>
								<tr>
									<th class="thwidthcon">이름</th>
									<th class="thwidthcon">직위</th>
									<th class="thwidthcon">공정</th>
									<th class="thwidthcon">설비</th>
									<th class="thwidthcon">정규직</th>
									<th class="thwidthcon">회사</th>
									<th class="thwidthcon">mLevel</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="membername" style="width: 80px;"
										placeholder="최지훈"></td>
									<td><select id="position">
											<option value="" selected="selected">-직급을 선택하세요-</option>
											<option value="관리자">관리자</option>
											<option value="반장">반장</option>
											<option value="조장">조장</option>
											<option value="사원">사원</option>
									</select></td>
									<td><select id="pcode">
											<option value="" selected="selected">-공정을 선택하세요-</option>
											<option value="p01">열처리</option>
											<option value="p02">포토</option>
											<option value="p03">감광성인쇄</option>
											<option value="p04">합지</option>
											<option value="p05">본딩,조립</option>
									</select></td>
									<td><select id="fcode">
											<option value="" selected="selected">-설비를 선택하세요-</option>
									</select></td>
									<td><select id="regular">
											<option value="" selected="selected">-정규직 여부-</option>
											<option value="y">Yes</option>
											<option value="n">No</option>
									</select></td>
									<td><select id="ccode">
											<option value="" selected="selected">-회사를 선택하세요-</option>
											<option value="c01">일성</option>
											<option value="c02">이양</option>
											<option value="c03">삼호</option>
											<option value="c00">아이티스쿨</option>
									</select></td>
									<td><input type="text" id="memlevel" placeholder="1" style="width: 50px;"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">
					<span style="float: right;"><button type="button" class="btn btn-primary"
							id="workerInsertBtn">저장</button></span>
				</div>
			</div>

			<!--worker List  -->
			<div class="card mb-3">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-3" style="margin-top: 5px;">
							<i class="fas fa-users"></i> 사원관리
						</div>
						<div class="col-sm-9">
							<span style="float: right; height: 34px"><label id="excelExport"></label></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="workerlist">
							<thead>
								<tr>
									<th class="thwidthcon"><input type="checkbox" name="checkAll"
										id="th_checkAll" onclick="checkAll();"></th>
									<th class="thwidthcon">입력일</th>
									<th class="thwidthcon">사번</th>
									<th class="thwidthcon">이름</th>
									<th class="thwidthcon">직위</th>
									<th class="thwidthcon">공정</th>
									<th class="thwidthcon">설비</th>
									<th class="thwidthcon">정규직</th>
									<th class="thwidthcon">회사</th>
									<th class="thwidthcon">mLevel</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th class="thwidthcon">입력일</th>
									<th class="thwidthcon">사번</th>
									<th class="thwidthcon">이름</th>
									<th class="thwidthcon">직위</th>
									<th class="thwidthcon">공정</th>
									<th class="thwidthcon">설비</th>
									<th class="thwidthcon">정규직</th>
									<th class="thwidthcon">회사</th>
									<th class="thwidthcon">mLevel</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="lists" items="${lists}">
									<tr>
										<td><input type="checkbox" id="chkcode" name="checkRow"></td>
										<td>${lists.memberinsert.regdate}</td>
										<td>${lists.memberinsert.membercode}</td>
										<td><input class="wListTd" type="text"
											value="${lists.memberinsert.membername}"></td>
										<td><select id="position1">
												<option value="관리자"
													<c:if test="${lists.memberinsert.position eq '관리자'}">selected</c:if>>관리자</option>
												<option value="반장"
													<c:if test="${lists.memberinsert.position eq '반장'}">selected</c:if>>반장</option>
												<option value="조장"
													<c:if test="${lists.memberinsert.position eq '조장'}">selected</c:if>>조장</option>
												<option value="사원"
													<c:if test="${lists.memberinsert.position eq '사원'}">selected</c:if>>사원</option>
										</select></td>
										<td><select id="pcode1" class="wListTd1">
												<option value="p01"
													<c:if test="${lists.memberinsert.position eq 'p01'}">selected</c:if>>열처리</option>
												<option value="p02"
													<c:if test="${lists.memberinsert.position eq 'p02'}">selected</c:if>>포토</option>
												<option value="p03"
													<c:if test="${lists.memberinsert.position eq 'p03'}">selected</c:if>>감광성인쇄</option>
												<option value="p04"
													<c:if test="${lists.memberinsert.position eq 'p04'}">selected</c:if>>합지</option>
												<option value="p05"
													<c:if test="${lists.memberinsert.position eq 'p05'}">selected</c:if>>본딩,조립</option>
										</select></td>
										<td><select id="fcode1" class="wListTd1">
												<option value="${lists.facility.facilitycode}" selected="selected">${lists.facility.facilityname}</option>
										</select></td>
										<td><select id="regular1">
												<option value="y"
													<c:if test="${lists.memberinsert.regular eq 'y'}">selected</c:if>>y</option>
												<option value="n"
													<c:if test="${lists.memberinsert.regular eq 'n'}">selected</c:if>>n</option>
										</select></td>
										<td><select id="ccode1">
												<option value="c01"
													<c:if test="${lists.company.companycode eq 'c01'}">selected</c:if>>일성</option>
												<option value="c02"
													<c:if test="${lists.company.companycode eq 'c02'}">selected</c:if>>이양</option>
												<option value="c03"
													<c:if test="${lists.company.companycode eq 'c03'}">selected</c:if>>삼호</option>
												<option value="c00"
													<c:if test="${lists.company.companycode eq 'c00'}">selected</c:if>>아이티스쿨</option>
										</select>
										<td><input class="wListTd" type="text"
											value="${lists.memberinsert.memlevel}"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">
					<span style="float: right;"><button type="button" id="workerListDelete"
							class="btn btn-danger">삭제</button></span> <span style="float: right;"><button
							type="button" id="workerListModify" class="btn btn-success">수정</button></span>
				</div>
			</div>
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /.container-fluid -->
	<div style="display: none;">
		<table class="table table-bordered table-hover" id="workerListHidden">
			<thead>
				<tr>
					<th class="thwidthcon"><input type="checkbox"></th>
					<th class="thwidthcon">입력일</th>
					<th class="thwidthcon">사번</th>
					<th class="thwidthcon">이름</th>
					<th class="thwidthcon">직위</th>
					<th class="thwidthcon">공정</th>
					<th class="thwidthcon">설비</th>
					<th class="thwidthcon">정규직</th>
					<th class="thwidthcon">회사</th>
					<th class="thwidthcon">mLevel</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lists" items="${lists}">
					<tr>
						<td><input type="checkbox"></td>
						<td>${lists.memberinsert.regdate}</td>
						<td>${lists.memberinsert.membercode}</td>
						<td>${lists.memberinsert.membername}</td>
						<td>${lists.memberinsert.position}</td>
						<td>${lists.part.partname}</td>
						<td>${lists.facility.facilityname}</td>
						<td>${lists.memberinsert.regular}</td>
						<td>${lists.company.companyname}</td>
						<td>${lists.memberinsert.memlevel}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!--excel 출력용 List (히든)  -->

	<!-- The Modal -->
	<div class="modal fade" tabindex="-1" id="commonmodal" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">사원관리</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="commonuse">확인</button>
					<button type="button" class="btn btn-danger" id="commoncancel" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!--Modal End -->

	<content tag="local_script"> <!-- Datatable scripts for this page--> <script
		src="resources/template/js/part1/worker.js"></script> </content>
</body>
</html>


