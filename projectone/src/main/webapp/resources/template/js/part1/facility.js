function checkAll() {
	if ($("#th_checkAll").is(':checked')) {
		$("input[name=checkRow]").prop("checked", true);
	} else {
		$("input[name=checkRow]").prop("checked", false);
	}
}

$(document).ready(function() {

/*	$('#testtable').DataTable({
		"dom" : 
			"<'row'<'col-sm-4'l><'col-sm-4'B><'col-sm-4'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-5'i><'col-sm-7'p>>",
		buttons : {
			buttons : [ {
				text:"test",
				action : function(e, dt, node, config) {
					alert('Activated!');
					this.disable(); // disable button
				}
			} ]
		},
	});*/
	// 버튼 중간에 넣는 테스트 소스
	
	var facilitytb = $('#facilitytable').DataTable({
		dom : 'Bfrtip',
		/*
		 * // 표시 건수기능 숨기기 lengthChange : false, // 정렬 기능 숨기기 ordering : false, //
		 * 정보 표시 숨기기 info : false, // 페이징 기능 숨기기 paging : false, // 검색 기능 숨기기
		 * searching : false,
		 */
		buttons : [ {
			extend : 'excelHtml5',
			text : '<i class="fas fa-file-excel"> Excel</i>',
			title : '설비점검일정',
			bom : true,
			className : 'btn btn-dark',
			customize : function(xlsx) {
				var sheet = xlsx.xl.worksheets['설비점검일정.xml'];
				// jQuery selector to add a border
				$('row c[r*="10"]', sheet).attr('s', '25');
			}
		} ],
		// header 고정 여부 , scoll 기능과 동시 샤용 안됨.
		"fixedHeader" : false,
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
		},
		'columnDefs' : [ {
			'targets' : [ 0 ], /* column index */
			'orderable' : false, /* true or false */
		} ]
	});
	facilitytb.buttons().container().appendTo($('#excelExport'));
});
