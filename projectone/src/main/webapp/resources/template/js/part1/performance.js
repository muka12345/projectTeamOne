// Call the dataTables jQuery plugin

$(document).ready(function() {

	var Protable = $('#proexcel').DataTable({
		dom : 'Bfrtip',
		// 표시 건수기능 숨기기
		lengthChange : false,
		// 정렬 기능 숨기기
		ordering : false,
		// 정보 표시 숨기기
		info : false,
		// 페이징 기능 숨기기
		paging : false,
		// 검색 기능 숨기기
		searching : false,
		buttons : [ {
			extend : 'excelHtml5',
			text : '<i class="fas fa-file-excel"> Excel</i>',
			title : '공정별생산실적',
			bom : true,
			className : 'btn btn-dark',
			customize : function(xlsx) {
				var sheet = xlsx.xl.worksheets['공정별생산실적.xml'];
				// jQuery selector to add a border
				$('row c[r*="10"]', sheet).attr('s', '25');
			}
		} ],
		"scrollY" : 600,
		"scrollCollapse" : true,
		"stateSave" : true,
		"language" : {
			"lengthMenu" : "_MENU_ 개씩 보기",
			"zeroRecords" : "데이터가 존재하지 않습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 개)",
			"infoEmpty" : "데이터가 존재하지 않습니다.",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"thousands" : ",",
			"search" : "검색",
			"infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			}
		}
	});
	Protable.buttons().container().appendTo($('#excelExport'));
	
	var modeltable = $('#modelexcel').DataTable({
		dom : 'Bfrtip',
		// 표시 건수기능 숨기기
		lengthChange : false,
		// 정렬 기능 숨기기
		ordering : false,
		// 정보 표시 숨기기
		info : false,
		// 페이징 기능 숨기기
		paging : false,
		// 검색 기능 숨기기
		searching : false,
		buttons : [ {
			extend : 'excelHtml5',
			text : '<i class="fas fa-file-excel"> Excel</i>',
			title : '모델별생산실적',
			bom : true,
			className : 'btn btn-dark',
			customize : function(xlsx) {
				var sheet = xlsx.xl.worksheets['모델별생산실적.xml'];
				// jQuery selector to add a border
				$('row c[r*="10"]', sheet).attr('s', '25');
			}
		} ],
		"scrollY" : 600,
		"scrollCollapse" : true,
		"stateSave" : true,
		"language" : {
			"lengthMenu" : "_MENU_ 개씩 보기",
			"zeroRecords" : "데이터가 존재하지 않습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 개)",
			"infoEmpty" : "데이터가 존재하지 않습니다.",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"thousands" : ",",
			"search" : "검색",
			"infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			}
		}
	});
	modeltable.buttons().container().appendTo($('#excelExport'));
	
	var inventable = $('#invenexcel').DataTable({
		dom : 'Bfrtip',
		// 표시 건수기능 숨기기
		lengthChange : false,
		// 정렬 기능 숨기기
		ordering : false,
		// 정보 표시 숨기기
		info : false,
		// 페이징 기능 숨기기
		paging : false,
		// 검색 기능 숨기기
		searching : false,
		buttons : [ {
			extend : 'excelHtml5',
			text : '<i class="fas fa-file-excel"> Excel</i>',
			title : '공정재고현황',
			bom : true,
			className : 'btn btn-dark',
			customize : function(xlsx) {
				var sheet = xlsx.xl.worksheets['공정재공현황.xml'];
				// jQuery selector to add a border
				$('row c[r*="10"]', sheet).attr('s', '25');
			}
		} ],
		"scrollY" : 600,
		"scrollCollapse" : true,
		"stateSave" : true,
		"language" : {
			"lengthMenu" : "_MENU_ 개씩 보기",
			"zeroRecords" : "데이터가 존재하지 않습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 개)",
			"infoEmpty" : "데이터가 존재하지 않습니다.",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"thousands" : ",",
			"search" : "검색",
			"infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			}
		}
	});
	inventable.buttons().container().appendTo($('#excelExport'));
});
