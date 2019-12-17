<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산정보시스템</title>
</head>

<body id="page-top">
	<div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><span style="color: black;"> <i class="fas fa-thumbs-up"></i>
				</span>생산본부현황</li>
				<li class="breadcrumb-item active">요약</li>
			</ol>

			<!-- Icon Cards-->
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-boxes"></i>
							</div>
							<div class="mr-5">1,000,000개</div>
						</div>
						<div class="card-footer text-white clearfix small z-1">
							<span class="float-left">생산현황</span>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-signal"></i>
							</div>
							<div class="mr-5">94.7%</div>
						</div>
						<div class="card-footer text-white clearfix small z-1">
							<span class="float-left">종합수율</span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-user"></i>
							</div>
							<div class="mr-5">1023명 / 1030명</div>
						</div>
						<div class="card-footer text-white clearfix small z-1">
							<span class="float-left">작업사원</span>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-wrench"></i>
							</div>
							<div class="mr-5">2대</div>
						</div>
						<div class="card-footer text-white clearfix small z-1">
							<span class="float-left">비가동 설비</span>
						</div>
					</div>
				</div>
			</div>

			<!-- DataTables Example -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 실적현황

				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable" width="100%" >
							<thead>
								<tr>
									<th>모델</th>
									<th>1차동작</th>
									<th>1차외관</th>
									<th>최종외관</th>
									<th>종합수율</th>
									<th>열처리</th>
									<th>포토</th>
									<th>인쇄</th>
									<th>합지</th>
									<th>본딩</th>
									<th>조립</th>
									<th>출하</th>
									<th>재고</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>모델</th>
									<th>1차동작</th>
									<th>1차외관</th>
									<th>최종외관</th>
									<th>종합수율</th>
									<th>열처리</th>
									<th>포토</th>
									<th>인쇄</th>
									<th>합지</th>
									<th>본딩</th>
									<th>조립</th>
									<th>출하</th>
									<th>재고</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
								<tr>
									<td>itsc01</td>
									<td>92</td>
									<td>94</td>
									<td>95</td>
									<td>94</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>100000</td>
									<td>3242</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-wrapper -->
	<content tag="local_script"> <!-- datatable scripts for this page--> <script
		src="resources/template/js/part1/indexdatatables.js"></script> </content>
</body>
</html>


