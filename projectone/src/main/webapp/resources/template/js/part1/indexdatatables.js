// Call the dataTables jQuery plugin
$(document).ready(function() {
	$('#dataTable').DataTable({
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
		},
	});
});
