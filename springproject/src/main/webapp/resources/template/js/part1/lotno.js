// Call the dataTables jQuery plugin
function checkAll() {
	if ($("#th_checkAll").is(':checked')) {
		$("input[name=checkRow]").prop("checked", true);
	} else {
		$("input[name=checkRow]").prop("checked", false);
	}
}

$(document).ready(function() {
	$('input.defect').on('keyup',function(){
		var cnt = $('.cul input.defect').length;
		/*console.log(cnt);*/
		 for (var i = 1; i < cnt; i++) {
	            var sum = parseInt($(this).val() || 0);
	            sum++
	           /* console.log(sum);*/
	        }
		 var sum1 = parseInt($('input[name=defectqty1]').val() || 0); 
	     var sum2 = parseInt($('input[name=defectqty2]').val() || 0);
	     var sum3 = parseInt($('input[name=defectqty3]').val() || 0);
	     var sum4 = parseInt($('input[name=defectqty4]').val() || 0);
	     var sum5 = parseInt($('input[name=defectqty5]').val() || 0);
	  // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
	     var sum = sum1+sum2+sum3+sum4+sum5;
	     /*console.log(sum);*/
	     $('input[name=defectsum]').val(sum);
	});
	// 불량 수량 실시간 집계를 위함
	
	$('#lotno1').on("change",function(){
	  var LotNoInsertForm = $('#insertLotForm').serialize();
	  $.ajax({
			type : 'POST',
			data : LotNoInsertForm,
			datatype : 'json',
			url : 'lotNoInsert',
			success : function(data) {

			},
			error : function(request,status,error) {
				alert("저장되지 않았습니다.");
				alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				return;
			}
		});
	});
	
	
	$('#lotInsertBtn1').on('click',function(){
       var LotNoInsertForm = $('#insertLotForm').serialize();
   	$.ajax({
		type : 'POST',
		data : LotNoInsertForm,
		datatype : 'json',
		url : 'lotNoInsert',
		success : function(data) {
			if(data == "1"){
				alert("저장되었습니다.");
				$('input[name=input]').val("");
				$('input[name=output]').val("");
				$('input[name=defectqty1]').val("");
				$('input[name=defectqty2]').val("");
				$('input[name=defectqty3]').val("");
				$('input[name=defectqty4]').val("");
				$('input[name=defectqty5]').val("");
				location.reload();
			}
		},
		error : function(request,status,error) {
			alert("저장되지 않았습니다.");
			alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			return;
		}
	});
	});
	//lot 입력 작성 중
	
	$('#lotDelteBtn1').on('click', function(){
		var checkbox = $('input[id=chklot]:checked');
		var tr = checkbox.parent().parent();
		var td = tr.children();
		checkbox.each(function(i){
		tr = checkbox.parent().parent().eq(i);
		td = tr.children();
		var lotno = td.eq(5).text();
		$('.modal-body').text("삭제 하시겠습니까?");
		$('#commonuse').text("확인");
		$('#commonmodal').modal('show');
		$('#commonuse').show();
		$('#commoncancel').show();
		$('#commonclose').hide();
		$('#commonuse').on('click', function() {
		$.ajax({
			type : 'POST',
			data : {
				lotno : lotno
			},
			datatype : 'json',
			url : 'deleteLotNo',
			success : function(data) {
				alert(100);
				msg = "삭제 되었습니다";
				if (data == "1")
					msg = "삭제 되었습니다!";
				    tr.remove();
				$('.modal-body').text(msg);
				$('#commonuse').show();
				$('#commoncancel').hide();
				$('#commonclose').show();
				$('#commonmodal').modal('show');
				$('#commonuse').on('click', function() {
					$('#commonmodal').modal('hide');
					$('#commonuse').unbind('click');
					location.reload();
					return;
				});
			},
			error : function(request,status,error) {
				alert("삭제되지 않았습니다.");
				alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		return;
		});	
		});
	});
	// lot NO리스트 삭제
	
	    $('#lotCreateBtn').on('click', function(){
	      var cuscode = $('#cuscode').val();
	      var productcode = $('#productcode').val();
	      var modelcode = $('#modelcode').val();
	    	$.ajax({
	    		type : 'POST',
	    		data : {
	    			cuscode : cuscode,
	    			productcode : productcode,
	    			modelcode : modelcode,
					    },
	    		datatype : 'json',	
	    		url : 'createLotNo',
	    		success : function(data) {
	    			if(data == "1"){
	    				alert("저장되었습니다.")
	    				location.reload();
	    			}
	    		},
	    		error : function(request,status,error) {
	    			alert("저장되지 않았습니다.");
	    			alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    			return;
	    		}
	    	});	
	    });
	    // LOT NO Create 끝
	    
		$('#lotCreateTable').DataTable({
			// 표시 건수기능 숨기기
			lengthChange : false,
			// 검색 기능 숨기기
			searching : false,
			// 정렬 기능 숨기기
			ordering : false,
			// 정보 표시 숨기기
			info : false,
			// 페이징 기능 숨기기
			paging : false,
			scrollY : "300px",
			scrollX : true,
			scrollCollapse : true
		});
		// Lot 입력용 테이블 끝

		lotListExcel = $('#lotListTable').DataTable({
			dom : "<'row'<'col-sm-4'l><'col-sm-4'B><'col-sm-4'f>>" +
			  	  "<'row'<'col-sm-12'tr>>" +
		          "<'row'<'col-sm-5'i><'col-sm-7'p>>",
			buttons : [ {
				extend : 'excelHtml5',
				text : '<i class="fas fa-file-excel"> Excel</i>',
				title : 'LOT리스트',
				bom : true,
				className : 'btn btn-dark',
				customize : function(xlsx) {
					var sheet = xlsx.xl.worksheets['LOT리스트.xml'];
					// jQuery selector to add a border
					$('row c[r*="10"]', sheet).attr('s', '25');
				}
			}],
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
			'columnDefs' : [ {
				'targets' : [ 0 ], /* column index */
				'orderable' : false, /* true or false */
			} ]
		});
		lotListExcel.buttons().container().appendTo($('#excelExport'));
		//lot List 수정, 삭제용 Table 끝

		var table1 = $('#dataTable2').DataTable({
			dom : 'Bfrtip',
			buttons : [ {
				extend : 'excelHtml5',
				text : '<i class="fas fa-file-excel"> Excel</i>',
				title : 'LOT번호별조회',
				bom : true,
				className : 'btn btn-dark',
				customize : function(xlsx) {
					var sheet = xlsx.xl.worksheets['LOT번호별조회.xml'];
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
		table1.buttons().container().appendTo($('#excelExport'));
		
		var LotNotable = $('#LotNoexcel').DataTable({
			dom : 'Bfrtip',
			// 표시 건수기능 숨기기
			lengthChange : false,
			// 정렬 기능 숨기기
			ordering : false,
			// 정보 표시 숨기기
			info : false,
			// 페이징 기능 숨기기
			paging : false,
			buttons : [ {
				extend : 'excelHtml5',
				text : '<i class="fas fa-file-excel"> Excel</i>',
				title : 'LOT번호별조회',
				bom : true,
				className : 'btn btn-dark',
				customize : function(xlsx) {
					var sheet = xlsx.xl.worksheets['LOT번호별조회.xml'];
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
		LotNotable.buttons().container().appendTo($('#excelExport'));
		
		var tablecopy = $('#dataTablecopy').DataTable({
			lengthChange : false,
			searching : false,
			ordering : false,
			info : false,
			paging : false,
			dom : 'Bfrtip',
			buttons : [ {
				extend : 'copyHtml5',
				text : '<i class="fas fa-copy"> Copy</i>',
				className : 'btn btn-dark',
				footer: true,
			} ],
			language : {
				buttons : {
					copyTitle : '클립보드에 복사하였습니다.',
					copySuccess : {
						_ : '%d 개의 Data를 복사하였습니다.',
						1 : '1 개의 Data를 복사하였습니다.'
					}
				}
			}
		});
		tablecopy.buttons().container().appendTo($('#copyall'));

		$('#defectiveDetailTd').on('click',
				function() {
					var boardInsert = window.open("defectiveDetail",
							"_blank",
							"top=160,left=160,width=1300,height=700");

		});
		
		var lottable = $('#lotlisttable').DataTable({
			dom : 'Bfrtip',
			buttons : [ {
				extend : 'excelHtml5',
				text : '<i class="fas fa-file-excel"> Excel</i>',
				title : 'LOT입력리스트',
				bom : true,
				className : 'btn btn-dark',
				customize : function(xlsx) {
					var sheet = xlsx.xl.worksheets['LOT입력리스트.xml'];
					// jQuery selector to add a border
					$('row c[r*="10"]', sheet).attr('s', '25');
				}
			} ],
			"scrollX": true,
			"scrollY" : 300,
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
			'columnDefs' : [ {
				'targets' : [ 0 ], /* column index */
				'orderable' : false, /* true or false */
			} ]
		});
		lottable.buttons().container().appendTo($('#excelExport'));
	});
