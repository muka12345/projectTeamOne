/*$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});*/

// code 숫자만 입력 
function checkAll() {
	if ($("#th_checkAll").is(':checked')) {
		$("input[name=checkRow]").prop("checked", true);
	} else {
		$("input[name=checkRow]").prop("checked", false);
	}
}
//전체 선택 해제 
$(document).ready(function() {
	
	$('#attenListBtn').on('click',function(){
		$.ajax({
			type : 'POST',
			datatype : 'json',
			url : 'copyLog',
			success : function(data) {
				alert("조회에 성공하였습니다.")
				location.reload();
			},
			error : function(request,status,error) {
				alert("조회를 실패하였습니다.");
				alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				return;
			}
		});
	 });
	// 근태 리스트 조회 끝!
	
	$('#attenListdelBtn').on('click', function() {
		var checkbox = $('input[id=chkatten]:checked');
		var tr = checkbox.parent().parent();
		var td = tr.children();
		checkbox.each(function(i){
			tr = checkbox.parent().parent().eq(i);
			td = tr.children();
			var workingday = td.eq(1).text();
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
					workingday : workingday
				},
				datatype : 'json',
				url : 'attenDeleteRow',
				success : function(data) {
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
	// 근태리스트 Delete Ajax 끝!
	
	$('#attendanceInsert').on('click',function(){
		$('#workerattendance tr').each(function(){
			var td = $(this).children();
			var membercode = td.eq(0).text();
			var absence = td.eq(4).children();
			if(absence.prop("checked")){
			   absence.val(1);
			}else{
			   absence.val(0);
			}
			var halfday = td.eq(5).children();
			if(halfday.prop("checked")){
				halfday.val(1);
			}else{
				halfday.val(0);
			}
			var early = td.eq(6).children();
			if(early.prop("checked")){
				early.val(1);
			}else{
				early.val(0);
			}
			var late = td.eq(7).children();
			if(late.prop("checked")){
				late.val(1);
			}else{
				late.val(0);
			}
			var sick = td.eq(8).children();
			if(sick.prop("checked")){
				sick.val(1);
			}else{
				sick.val(0);
			}
			$.ajax({
				type : 'POST',
				data : {
					membercode : membercode,
					absence : absence.val(),
					halfday : halfday.val(),
					early : early.val(),
					late : late.val(),
					sick : sick.val()
				},
				datatype : 'json',
				url : 'attenInsert',
				success : function(data) {
					if(data == "1"){
					}
				},
				error : function(request,status,error) {
					alert("저장되지 않았습니다.");
					alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return;
				}
			});
		});
		alert("저장되었습니다.")
		location.reload();
	});
	// 출석(근태관리) 입력 끝!
	
	$('#workerListModify').on('click', function() {
		var checkbox = $('input[id=chkcode]:checked');
		var tr = checkbox.parent().parent();
		var td = tr.children();
		checkbox.each(function(i){
			tr = checkbox.parent().parent().eq(i);
			td = tr.children();
			var membercode = td.eq(2).text();
			var membername = td.eq(3).children().val();
			var position = td.eq(4).children().val();
			var pcode = td.eq(5).children().val();
			var fcode = td.eq(6).children().val();
			var regular = td.eq(7).children().val();
			var ccode = td.eq(8).children().val();
			var memlevel = td.eq(9).children().val();
			$('.modal-body').text("수정 하시겠습니까?");
			$('#commonuse').text("확인");
			$('#commonmodal').modal('show');
			$('#commonuse').show();
			$('#commoncancel').show();
			$('#commonclose').hide();
			$('#commonuse').on('click', function() {
			$.ajax({
				type : 'POST',
				data : {
					membercode : membercode,
					membername : membername,
					position : position,
					pcode : pcode,
					fcode : fcode,
					regular : regular,
					ccode : ccode,
					memlevel : memlevel
				},
				datatype : 'json',
				url : 'workerModifyRow',
				success : function(data) {
					location.reload();
					var msg = "수정 되지않았습니다!";
					if (data == "1")
						msg = "수정 되었습니다!";
					$('.modal-body').text(msg);
					$('#commonuse').show();
					$('#commoncancel').hide();
					$('#commonclose').show();
					$('#commonmodal').modal('show');
					$('#commonuse').on('click', function() {
						$('#commonmodal').modal('hide');
						return;
					});
				},
				error : function(request,status,error) {
					alert("수정되지 않았습니다.");
					alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			return;
			});
		});
	});
	//사원 관리 UPdate Ajax 통신 끝
	
	$(document).on('change','#pcode1', function(){
		var part1 = $('#pcode1').val();
		$('#fcode1').empty();
		
		if(part1 == "p01"){
	      $('#fcode1').append("<option value='f01'>어닐링IR호기</option>");
	      $('#fcode1').append("<option value='f21'>반장</option>");
		  $('#fcode1').append("<option value='f22'>조장</option>");
		  $('#fcode1').append("<option value='f23'>관리자</option>");
		}if(part1 =="p02"){
		  $('#fcode1').append("<option value='f02'>라미기</option>");
		  $('#fcode1').append("<option value='f03'>노광기</option>");
		  $('#fcode1').append("<option value='f04'>D.E.S</option>");
		  $('#fcode1').append("<option value='f21'>반장</option>");
		  $('#fcode1').append("<option value='f22'>조장</option>");
		  $('#fcode1').append("<option value='f23'>관리자</option>");
		}if(part1 == "p03"){
		  $('#fcode1').append("<option value='f05'>인쇄기</option>");
		  $('#fcode1').append("<option value='f06'>노광기</option>");
		  $('#fcode1').append("<option value='f07'>현상기</option>");	
		  $('#fcode1').append("<option value='f08'>박스오븐</option>");	
		  $('#fcode1').append("<option value='f09'>보호라미</option>");
		  $('#fcode1').append("<option value='f21'>반장</option>");
		  $('#fcode1').append("<option value='f22'>조장</option>");
		  $('#fcode1').append("<option value='f23'>관리자</option>");
		}if(part1 == "p04"){
		  $('#fcode1').append("<option value='f10'>오토트리머</option>");
		  $('#fcode1').append("<option value='f11'>합지기</option>");
		  $('#fcode1').append("<option value='f12'>1차동작검사</option>");	
		  $('#fcode1').append("<option value='f13'>1차외관검사</option>");	
		  $('#fcode1').append("<option value='f21'>반장</option>");
		  $('#fcode1').append("<option value='f22'>조장</option>");
		  $('#fcode1').append("<option value='f23'>관리자</option>");
		}if(part1 == "p05"){
		  $('#fcode1').append("<option value='f14'>ACF 가접</option>");
		  $('#fcode1').append("<option value='f15'>ACF 본접</option>");
		  $('#fcode1').append("<option value='f16'>본딩기</option>");	
		  $('#fcode1').append("<option value='f17'>현미경검사</option>");		
		  $('#fcode1').append("<option value='f18'>2차동작검사</option>");		
		  $('#fcode1').append("<option value='f19'>3차동작검사</option>");		
		  $('#fcode1').append("<option value='f20'>최종외관</option>");	
		  $('#fcode1').append("<option value='f21'>반장</option>");
		  $('#fcode1').append("<option value='f22'>조장</option>");
		  $('#fcode1').append("<option value='f23'>관리자</option>");
		}
	});
	// 워커리스트 수정 , 삭제용 테이블 select 끝
	
	$('#workerListDelete').on('click', function() {
	var checkbox = $('input[id=chkcode]:checked');
	var tr = checkbox.parent().parent();
	var td = tr.children();
	checkbox.each(function(i){
		tr = checkbox.parent().parent().eq(i);
		td = tr.children();
		var membercode = td.eq(2).text();
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
				membercode : membercode
			},
			datatype : 'json',
			url : 'workerDeleteRow',
			success : function(data) {
				tr.remove();
				var msg = "삭제 되지않았습니다!";
				if (data == "1")
					msg = "삭제 되었습니다!";
				$('.modal-body').text(msg);
				$('#commonuse').show();
				$('#commoncancel').hide();
				$('#commonclose').show();
				$('#commonmodal').modal('show');
				$('#commonuse').on('click', function() {
					$('#commonmodal').modal('hide');
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
	//사원 관리 Delelte Ajax 통신 끝
	$(document).on('change','#position', function(){
		var position = $('#position').val();
		$('#fcode').empty();
		if(position == "관리자"){	
			$('#regular').val("y");
			$('#ccode').val("c00");
			$('#memlevel').val("9");
			$('#fcode').append("<option value='f23' selected>관리자</option>");
		}if(position == "반장"){
			$('#regular').val("y");
			$('#ccode').val("c00");
			$('#memlevel').val("8");
			$('#fcode').append("<option value='f21' selected>반장</option>");
		}if(position == "조장"){
			$('#regular').val("y");
			$('#ccode').val("c00");
			$('#memlevel').val("8");
			$('#fcode').append("<option value='f22' selected>조장</option>");
		}if(position == "사원"){
			$('#regular').val("");
			$('#ccode').val("");
			$('#memlevel').val("1");
			$(document).on('change','#pcode', function(){
				var part = $('#pcode').val();
				$('#fcode').empty();
				if(part == "p01"){
			      $('#fcode').append("<option value='f01' selected>어닐링IR호기</option>");
				}if(part =="p02"){
				  $('#fcode').append("<option value='f02' selected>라미기</option>");
				  $('#fcode').append("<option value='f03'>노광기</option>");
				  $('#fcode').append("<option value='f04'>D.E.S</option>");
				}if(part == "p03"){
				  $('#fcode').append("<option value='f05' selected>인쇄기</option>");
				  $('#fcode').append("<option value='f06'>노광기</option>");
				  $('#fcode').append("<option value='f07'>현상기</option>");	
				  $('#fcode').append("<option value='f08'>박스오븐</option>");	
				  $('#fcode').append("<option value='f09'>보호라미</option>");	
				}if(part == "p04"){
				  $('#fcode').append("<option value='f10' selected>오토트리머</option>");
				  $('#fcode').append("<option value='f11'>합지기</option>");
				  $('#fcode').append("<option value='f12'>1차동작검사</option>");	
				  $('#fcode').append("<option value='f13'>1차외관검사</option>");	
				}if(part == "p05"){
				  $('#fcode').append("<option value='f14' selected>ACF 가접</option>");
				  $('#fcode').append("<option value='f15'>ACF 본접</option>");
				  $('#fcode').append("<option value='f16'>본딩기</option>");	
				  $('#fcode').append("<option value='f17'>현미경검사</option>");		
				  $('#fcode').append("<option value='f18'>2차동작검사</option>");		
				  $('#fcode').append("<option value='f19'>3차동작검사</option>");		
				  $('#fcode').append("<option value='f20'>최종외관</option>");		
				}
			});
		}
	});
	// worker insert select box 끝
	  $('#workerInsertBtn').on('click', function() {
		var membercode = $('#membercode').val();
		var membername = $('#membername').val();
		var position = $('#position').val();
		var regular = $('#regular').val();
		var memlevel = $('#memlevel').val();
		var pcode = $('#pcode').val();	
		var ccode = $('#ccode').val();
		var fcode = $('#fcode').val();
		if($('#fcode').val() == ""){
   		 alert("공정을 선택하세요");	
   		 return;
		}
		if($('#membername').val() == ""){
		 alert("이름을 기입하세요");	
		 return;
		}
		if($('#memlevel').val() == ""){
			 alert("레벨을 기입하세요");	
			 return;
			}
		if($('#pcode').val() == ""){
			 alert("파트를 선택하세요");	
			 return;
			}
		if($('#ccode').val() == ""){
			 alert("회사를 선택하세요");	
			 return;
			}
		$.ajax({
			type : 'POST',
			data : {
				membercode : membercode,
				membername : membername,
				position : position,
				regular : regular,
				memlevel : memlevel,
				pcode : pcode,
				ccode : ccode,
				fcode : fcode
			},
			datatype : 'json',
			url : 'workerInsertRow',
			success : function(data) {
				if(data == "1"){
				 alert("저장 되었습니다.");
				 $('#membername').val("");
				 $('#position').val("");
				 $('#pcode').val("");
				 $('#ccode').val("");
				 $('#fcode').val("");
				 $('#regular').val("");
				 $('#memlevel').val("");
				 location.reload();
				}
			},
			error : function(request,status,error) {
				alert("저장되지 않았습니다.");
				alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	//사원 관리 Insert Ajax 통신 끝
	
	$('#workerlist').DataTable({
		"scrollY" : 600,
		"scrollCollapse" : true,
		"stateSave" : true,
		"order": [[ 2, "desc" ]],
		"language" : {
			"lengthMenu" : "_MENU_ 개씩 보기",
			"zeroRecords" : "데이터가 존재하지 않습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 명)",
			"infoEmpty" : "데이터가 존재하지 않습니다.",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"thousands" : ",",
			"search" : "검색",
			"infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
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
	// 사원관리 삭제 수정용 테이블 끝
	var workerListHidden = $('#workerListHidden').DataTable({
		dom : 'Bfrtip',
		buttons : [ {
			extend : 'excelHtml5',
			text : '<i class="fas fa-file-excel"> Excel</i>',
			title : '사원관리',
			bom : true,
			className : 'btn btn-dark',
			customize : function(xlsx) {
				var sheet = xlsx.xl.worksheets['사원관리.xml'];
				// jQuery selector to add a border
				$('row c[r*="10"]', sheet).attr('s', '25');
			}
		} ]
	});
	workerListHidden.buttons().container().appendTo($('#excelExport'));
	// 사원관리 엑셀용 리스트 테이블 끝!
	
	$('#workerattendance').DataTable({
		"scrollY" : 600,
		"scrollCollapse" : true,
		"stateSave" : true,
		"language" : {
			"lengthMenu" : "_MENU_ 개씩 보기",
			"zeroRecords" : "데이터가 존재하지 않습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 명)",
			"infoEmpty" : "데이터가 존재하지 않습니다.",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"thousands" : ",",
			"search" : "검색",
			"infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			}
		},
		'columnDefs' : [ {
			'targets' : [ 4,5,6,7,8 ], /* column index */
			'orderable' : false, /* true or false */
		} ]
	});
	//근태관리 입력용 끝
	
	var workeratten = $('#workerattenlist').DataTable({
		"scrollY" : 600,
		"scrollCollapse" : true,
		"stateSave" : true,
		dom : "<'row'<'col-sm-4'l><'col-sm-4'B><'col-sm-4'f>>" +
			  "<'row'<'col-sm-12'tr>>" +
		      "<'row'<'col-sm-5'i><'col-sm-7'p>>",
		buttons : [ {
			extend : 'excelHtml5',
			text : '<i class="fas fa-file-excel"> Excel</i>',
			title : '근태관리',
			bom : true,
			className : 'btn btn-dark',
			customize : function(xlsx) {
				var sheet = xlsx.xl.worksheets['근태관리.xml'];
				// jQuery selector to add a border
				$('row c[r*="10"]', sheet).attr('s', '25');
			}
		} ],
		"language" : {
			"lengthMenu" : "_MENU_ 개씩 보기",
			"zeroRecords" : "데이터가 존재하지 않습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_ 명)",
			"infoEmpty" : "데이터가 존재하지 않습니다.",
			"loadingRecords" : "로딩중...",
			"processing" : "처리중...",
			"thousands" : ",",
			"search" : "검색",
			"infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			}
		},
		 "footerCallback": function ( row, data, start, end, display ) {
	            var api = this.api(), data;
	            // Remove the formatting to get integer data for summation
	            var intVal = function ( i ) {
	                return typeof i === 'string' ?
	                    i.replace(/[\$,]/g, '')*1 :
	                    typeof i === 'number' ?
	                        i : 0;
	            };
	            // Total over this page
	           var absendTotal = api
	                .column( 6, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	           var halfdayTotal = api
	           	   .column( 7, { page: 'current'} )
	           	   .data()
	           	   .reduce( function (a, b) {
	           		   return intVal(a) + intVal(b);
	           	   }, 0 );
	           var earlyTotal = api
           	       .column( 8, { page: 'current'} )
           	       .data()
           	       .reduce( function (a, b) {
           	    	   return intVal(a) + intVal(b);
           	       }, 0 );
	           var lateTotal = api
       	       		.column( 9, { page: 'current'} )
       	       		.data()
       	       		.reduce( function (a, b) {
       	       			return intVal(a) + intVal(b);
       	       		}, 0 );
	           var sickTotal = api
  	       			.column( 10, { page: 'current'} )
  	       			.data()
  	       			.reduce( function (a, b) {
  	       				return intVal(a) + intVal(b);
  	       			}, 0 );
	            // Update footer
	            $(api.column(5).footer()).html('합계');
	            $(api.column(6).footer()).html(absendTotal);
	            $(api.column(7).footer()).html(halfdayTotal);
	            $(api.column(8).footer()).html(earlyTotal);
	            $(api.column(9).footer()).html(lateTotal);
	            $(api.column(10).footer()).html(sickTotal);
	        },
		'columnDefs' : [ {
			'targets' : [ 0 ], /* column index */
			'orderable' : false, /* true or false */
		} ]
	});
	workeratten.buttons().container().appendTo($('#excelExport1'));
	// 근태관리 리스트 테이블
});
