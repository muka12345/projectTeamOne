function downloadEncoding(m_attach){
	var m_attach=encodeURI(m_attach);
    location.href="mailboxDownload?m_attach="+m_attach;
}
function openAddress(){  
    window.open("/muka12345/mailAddressBook", "주소록", 
    		"width=800, height=1000, toolbar=no, menubar=no, scrollbars=yes, resizable=no" ); 
}
function openInsert(){  
    window.open("/muka12345/mailInsertForm", "이메일 작성", 
    		"width=800, height=1000, toolbar=no, menubar=no, scrollbars=yes, status=no, resizable=no" ); 
}
function openReply(m_seq){  
    window.open("/muka12345/mailReplyForm?m_seq="+m_seq, "이메일 답변", 
    		"width=800, height=1000, toolbar=no, menubar=no, scrollbars=yes, status=no, resizable=no" ); 
}
function openForward(m_seq){  
    window.open("/muka12345/mailForwardForm?m_seq="+m_seq, "이메일 전달", 
    		"width=800, height=1000, toolbar=no, menubar=no, scrollbars=yes, status=no, resizable=no" ); 
}
function openTemporary(m_seq){  
    window.open("/muka12345/mailTemporaryDetail?m_seq="+m_seq, "임시메일 확인", 
    		"width=800, height=1000, toolbar=no, menubar=no, scrollbars=yes, status=no, resizable=no" ); 
}

function importartOn(m_seq){
	var seq=m_seq;
	
	$.ajax({
        type : 'POST',
        data : {
          m_seq:seq
        },
        datatype : 'json',
        url : 'mailSaveUpdate',
        success : function(data) {	
        	location.reload();
            return;
        	
        },
        error : function(request,status,error) {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
     });

}
function importartOff(m_seq){
	var seq=m_seq;
	$.ajax({
        type : 'POST',
        data : {
          m_seq:seq
        },
        datatype : 'json',
        url : 'saveMailMove',
        success : function(data) {
        	location.reload();
            return;
        },
        error : function(request,status,error) {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
     });

}

function filesizeChk(){
	var filename=document.getElementById('m_file').value;
	var str
	if(filename != ""){
		 var fileSize = document.getElementById('m_file').files[0].size;
		 var maxSize = 10 * 1024 * 1024;//10MB
	  
	   if(fileSize > maxSize){
	       alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
	       return;
	    }
	   
	   if (fileSize >= 1024 * 1024) {
	        fileSize = fileSize / (1024 * 1024);
	        fileSize = fileSize.toFixed(1);
	        str = fileSize + "MB";
	    }
	    //KB 단위 이상일때 KB 단위로 환산
	    else if (fileSize >= 1024) {
	        fileSize = fileSize / 1024;
	        fileSize = fileSize.toFixed(1);
	        str = fileSize + "KB";
	    }
	    //KB 단위보다 작을때 byte 단위로 환산
	    else {
	    	fileSize = fileSize.toFixed(1);
	        str = fileSize + ' byte';
	       
	    }
	   document.getElementById('m_filesize').value=str;
	 document.getElementById('m_content').focus();
	}
}

$(document).ready(function() {
	$(function() {
	 var availabletoemail=["bbb@b.com","admin@a.com","admin@b.com","ccc@c.com","aaa@a.com","ddd@d.com"]
//	var availabletoemail = new Array();
	
	 $("#m_toemail").autocomplete({
	        source: availabletoemail,
	        select: function(event, ui) {   
	           var toemail=ui.item.value;
	            $.ajax({
	                type : 'POST',
	                data : {
	                  email:toemail
	                },
	                datatype : 'json',
	                url : 'memberToName',
	                success : function(data) {
	                	 document.getElementById('m_toname').value=data.name;
	                	 document.getElementById('m_cc').focus();
	                },
	                error : function(request,status,error) {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                },
	             });
	        },
	        focus: function(event, ui) {

	            return false;

	            //event.preventDefault();

	        }

	    });

	});
	


//	출처: https://offbyone.tistory.com/260 [쉬고 싶은 개발자]
//	스펨메일함으로보냄
	  $('#checkspam').on('click', function(){
		  $('.modal-body').text("스펨처리 하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonclose').hide();
//          var rowData = new Array();
//          var tdArr = new Array();
          var checkbox = $("input[name=mailcheckbox]:checked");
          // 체크된 체크박스 값을 가져온다
          $('#commonuse').on('click', function() {
          checkbox.each(function(i) {
              // checkbox.parent() : checkbox의 부모는 <td>이다.
              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
              var tr = checkbox.parent().parent().eq(i);
              var td = tr.children();
//              // 체크된 row의 모든 값을 배열에 담는다.
//              rowData.push(tr.text());
              
              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
              var m_seq = td.eq(0).text()+"";      
              // 가져온 값을 배열에 담는다. 
      		$.ajax({
				url: "mailSpamUpdate",
				type: "POST",
				data: {m_seq:m_seq},
				success:function(data){
		            var msg = "스펨 메일함으로 이동되었습니다!";
		            $('.modal-body').text(msg);
		            $('#commonuse').show();
		            $('#commoncancel').hide();
		            $('#commonclose').hide();
		            $('#commonmodal').modal('show');
		            $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  location.reload();
		                  return;
		               });
				},
				error : function(request,status,error) {
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
			});
          });
          });
	  });
	  //삭제메일함으로전송
	  $('#checkdelete').on('click', function(){
		  $('.modal-body').text("삭제 하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonclose').hide();
	    
          var checkbox = $("input[name=mailcheckbox]:checked");
          
          // 체크된 체크박스 값을 가져온다
          $('#commonuse').on('click', function() {
          checkbox.each(function(i) {
  
              // checkbox.parent() : checkbox의 부모는 <td>이다.
              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
              var tr = checkbox.parent().parent().eq(i);
              var td = tr.children();
              
              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
              var m_seq = td.eq(0).text()+"";      
              // 가져온 값을 배열에 담는다. 
      		$.ajax({
				url: "mailDeleteUpdate",
				type: "POST",
				data: {m_seq:m_seq},
				success:function(data){
		            var msg = "삭제 메일함으로 이동되었습니다!";
		            $('.modal-body').text(msg);
		            $('#commonuse').show();
		            $('#commoncancel').hide();
		            $('#commonclose').hide();
		            $('#commonmodal').modal('show');
		            $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  location.reload();
		                  return;
		               });
				},
				error : function(request,status,error) {
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
			});
          });
          });
	  });
	  $('#checksave').on('click', function(){
		  $('.modal-body').text("중요처리 하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonclose').hide();
          var checkbox = $("input[name=mailcheckbox]:checked");
          // 체크된 체크박스 값을 가져온다
          $('#commonuse').on('click', function() {
          checkbox.each(function(i) {
              // checkbox.parent() : checkbox의 부모는 <td>이다.
              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
              var tr = checkbox.parent().parent().eq(i);
              var td = tr.children();
              var m_seq = td.eq(0).text()+"";      
              // 가져온 값을 배열에 담는다. 
      		$.ajax({
				url: "mailSaveUpdate",
				type: "POST",
				data: {m_seq:m_seq},
				success:function(data){
		            var msg = "중요 메일함으로 이동되었습니다!";
		            $('.modal-body').text(msg);
		            $('#commonuse').show();
		            $('#commoncancel').hide();
		            $('#commonclose').hide();
		            $('#commonmodal').modal('show');
		            $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  location.reload();
		                  return;
		               });
				},
				error : function(request,status,error) {
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
			});
          });
          });
	  });
	  //저장함에서되돌림
	  $('#savemove').on('click', function(){
		  $('.modal-body').text("저장 해제 하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonclose').hide();
          var checkbox = $("input[name=mailcheckbox]:checked");
          // 체크된 체크박스 값을 가져온다
          $('#commonuse').on('click', function() {
          checkbox.each(function(i) {
              // checkbox.parent() : checkbox의 부모는 <td>이다.
              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
              var tr = checkbox.parent().parent().eq(i);
              var td = tr.children();
              var m_seq = td.eq(0).text()+"";      
              // 가져온 값을 배열에 담는다. 
      		$.ajax({
				url: "saveMailMove",
				type: "POST",
				data: {m_seq:m_seq},
				success:function(data){
		            var msg = "이전 메일함으로 이동되었습니다!";
		            $('.modal-body').text(msg);
		            $('#commonuse').show();
		            $('#commoncancel').hide();
		            $('#commonclose').hide();
		            $('#commonmodal').modal('show');
		            $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  location.reload();
		                  return;
		               });
				},
				error : function(request,status,error) {
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
			});
          });
          });
	  });
	  //삭제메일함에서 되돌림
	  $('#deletesave').on('click', function(){
		  $('.modal-body').text("복원 하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonclose').hide();
          var checkbox = $("input[name=mailcheckbox]:checked");
          // 체크된 체크박스 값을 가져온다
          $('#commonuse').on('click', function() {
          checkbox.each(function(i) {
              // checkbox.parent() : checkbox의 부모는 <td>이다.
              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
              var tr = checkbox.parent().parent().eq(i);
              var td = tr.children();  
              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
              var m_seq = td.eq(0).text()+"";      
      		$.ajax({
				url: "mailDeleteSave",
				type: "POST",
				data: {m_seq:m_seq},
				success:function(data){
		            var msg = "정상적으로 복원되었습니다!";
		            $('.modal-body').text(msg);
		            $('#commonuse').show();
		            $('#commoncancel').hide();
		            $('#commonclose').hide();
		            $('#commonmodal').modal('show');
		            $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  location.reload();
		                  return;
		               });
				},
				error : function(request,status,error) {
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
			});
          });
          });
	  });      
	  //삭제메일함에서 삭제
	  $('#deleteend').on('click', function(){
		  $('.modal-body').text("삭제 하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonclose').hide();
	    
        
          var checkbox = $("input[name=mailcheckbox]:checked");
          
          // 체크된 체크박스 값을 가져온다
          $('#commonuse').on('click', function() {
          checkbox.each(function(i) {
              // checkbox.parent() : checkbox의 부모는 <td>이다.
              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
              var tr = checkbox.parent().parent().eq(i);
              var td = tr.children();
              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
              var m_seq = td.eq(0).text()+"";      
      		$.ajax({
				url: "mailDelete",
				type: "POST",
				data: {m_seq:m_seq},
				success:function(data){
		            var msg = "정상적으로 삭제되었습니다!";
		            $('.modal-body').text(msg);
		            $('#commonuse').show();
		            $('#commoncancel').hide();
		            $('#commonclose').hide();
		            $('#commonmodal').modal('show');
		            $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  location.reload();
		                  return;
		               });
				},
				error : function(request,status,error) {
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
			});
          });
          });
	  });      
	  //메일보관함내에서 올체크
          $('#mailboxForm #checkall').on('click', function(){
	        	if($('#checkall').prop("checked")){
	        		$("input[type=checkbox]").prop("checked",true);
	        	}else{
	        		$("input[type=checkbox]").prop("checked",false);
	        	}
	        	
	        });
	        $('#checkallbtn').on('click',function(){
	        	$("input[type=checkbox]").prop("checked",true);
	        });
	        $('#checkoutbtn').on('click',function(){
	        	$("input[type=checkbox]").prop("checked",false);
	        });
	//메일작성 submit
			$('#emailsend').on('click', function() {
				$('.modal-body').text("발송 하시겠습니까??");
				$('#commonuse').text("확인");
				$('#commonmodal').modal('show');
				$('#commonuse').show();
				$('#commoncancel').show();
				$('#commonuse').on('click', function() {
					$('#mail_insert').attr("action", "mailInsert");
					$('#mail_insert').submit();
				});
			});
			//메일작성->임시메일함으로
			$('#emailtemporary').on('click', function() {
				$('.modal-body').text("임시저장 하시겠습니까??");
				$('#commonuse').text("확인");
				$('#commonmodal').modal('show');
				$('#commonuse').show();
				$('#commoncancel').show();
				$('#commonuse').on('click', function() {
					$('#mail_insert').attr("action", "temporaryMailInsert");
					$('#mail_insert').submit();
				});
			});
			//임시메일함에서 업데이트
			$('#temporaryupdate').on('click', function() {
				$('.modal-body').text("업데이트 하시겠습니까??");
				$('#commonuse').text("확인");
				$('#commonmodal').modal('show');
				$('#commonuse').show();
				$('#commoncancel').show();
				$('#commonuse').on('click', function() {
					$('#temporary_detail').attr("action", "temporaryUpdate");
					$('#temporary_detail').submit();
				});
			});
			//임시메일함->전송(작성)
			$('#temporarysend').on('click', function() {
				$('.modal-body').text("발송 하시겠습니까??");
				$('#commonuse').text("확인");
				$('#commonmodal').modal('show');
				$('#commonuse').show();
				$('#commoncancel').show();
				$('#commonuse').on('click', function() {
					$('#temporary_detail').attr("action", "mailTemporarysend");
					$('#temporary_detail').submit();
				});
			});
			//전체메일함에서 삭제
			//임시메일도 바로삭제 
			  $('#deleteadmin').on('click', function(){
				  $('.modal-body').text("삭제 하시겠습니까?");
			      $('#commonuse').text("확인");
			      $('#commonmodal').modal('show');
			      $('#commonuse').show();
			      $('#commoncancel').show();
			      $('#commonclose').hide();
		          var checkbox = $("input[name=mailcheckbox]:checked");
		          // 체크된 체크박스 값을 가져온다
		          $('#commonuse').on('click', function() {
		          checkbox.each(function(i) {
		              // checkbox.parent() : checkbox의 부모는 <td>이다.
		              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		              var tr = checkbox.parent().parent().eq(i);
		              var td = tr.children();
		              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		              var m_seq = td.eq(0).text()+"";      
		      		$.ajax({
						url: "mailAdminDelete",
						type: "POST",
						data: {m_seq:m_seq},
						success:function(data){
				            var msg = "정상적으로 삭제되었습니다!";
				            $('.modal-body').text(msg);
				            $('#commonuse').show();
				            $('#commoncancel').hide();
				            $('#commonclose').hide();
				            $('#commonmodal').modal('show');
				            $('#commonuse').on('click', function() {
				                  $('#commonmodal').modal('hide');
				                  location.reload();
				                  return;
				               });
						},
						error : function(request,status,error) {
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
					});
		          });
		          });
			  });      
			  //스펨메일함에서 해제
			  $('#checksavespam').on('click', function(){
				  $('.modal-body').text("스펨해제 하시겠습니까?");
			      $('#commonuse').text("확인");
			      $('#commonmodal').modal('show');
			      $('#commonuse').show();
			      $('#commoncancel').show();
			      $('#commonclose').hide();
		          var checkbox = $("input[name=mailcheckbox]:checked");
		          // 체크된 체크박스 값을 가져온다
		          $('#commonuse').on('click', function() {
		          checkbox.each(function(i) {
		              // checkbox.parent() : checkbox의 부모는 <td>이다.
		              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		              var tr = checkbox.parent().parent().eq(i);
		              var td = tr.children();
		              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		              var m_seq = td.eq(0).text()+"";      		             
		      			$.ajax({
						url: "mailSpamSave",
						type: "POST",
						data: {m_seq:m_seq},
						success:function(data){
				            var msg = "정상적으로 해제되었습니다!";
				            $('.modal-body').text(msg);
				            $('#commonuse').show();
				            $('#commoncancel').hide();
				            $('#commonclose').hide();
				            $('#commonmodal').modal('show');
				            $('#commonuse').on('click', function() {
				                  $('#commonmodal').modal('hide');
				                  location.reload();
				                  return;
				               });
						},
						error : function(request,status,error) {
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
					});
		          });
		          });
			  });      
			  //전체메일함-->삭제메일함
			  $('#checkadmindelete').on('click', function(){
				  $('.modal-body').text("삭제 하시겠습니까?");
			      $('#commonuse').text("확인");
			      $('#commonmodal').modal('show');
			      $('#commonuse').show();
			      $('#commoncancel').show();
			      $('#commonclose').hide();
		          var checkbox = $("input[name=mailcheckbox]:checked");
		          // 체크된 체크박스 값을 가져온다
		          $('#commonuse').on('click', function() {
		          checkbox.each(function(i) {
		              // checkbox.parent() : checkbox의 부모는 <td>이다.
		              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		              var tr = checkbox.parent().parent().eq(i);
		              var td = tr.children();
		              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		              var m_seq = td.eq(0).text()+"";      
		              // 가져온 값을 배열에 담는다. 
		      			$.ajax({
						url: "mailDeleteUpdate",
						type: "POST",
						data: {m_seq:m_seq},
						success:function(data){
				            var msg = "삭제 메일함으로 이동되었습니다!";
				            $('.modal-body').text(msg);
				            $('#commonuse').show();
				            $('#commoncancel').hide();
				            $('#commonclose').hide();
				            $('#commonmodal').modal('show');
				            $('#commonuse').on('click', function() {
				                  $('#commonmodal').modal('hide');
				                  location.reload();
				                  return;
				               });
						},
						error : function(request,status,error) {
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
					});
		          });
		          });
			  });
			  $('#maildetaildel').on('click', function() {
			      $('.modal-body').text("삭제 하시겠습니까?");
			      $('#commonuse').text("확인");
			      $('#commonmodal').modal('show');
			      $('#commonuse').show();
			      $('#commoncancel').show();
			      $('#commonclose').hide();
			      $('#commonuse').on('click', function() {
			         var m_seq = $('#m_seq').val();
			         location.href("mailDetailMove?m_seq="+m_seq);            
			      });
			   });
			  $('#mailtemporarydetaildel').on('click', function() {
			      $('.modal-body').text("삭제 하시겠습니까?");
			      $('#commonuse').text("확인");
			      $('#commonmodal').modal('show');
			      $('#commonuse').show();
			      $('#commoncancel').show();
			      $('#commonclose').hide();
			      $('#commonuse').on('click', function() {
			         var m_seq = $('#m_seq').val();
			         location.href("mailTemporaryDelete?m_seq="+m_seq);
			      });
			   });
			  $('#maildeletedel').on('click', function() {
			      $('.modal-body').text("삭제 하시겠습니까?");
			      $('#commonuse').text("확인");
			      $('#commonmodal').modal('show');
			      $('#commonuse').show();
			      $('#commoncancel').show();
			      $('#commonclose').hide();
			      $('#commonuse').on('click', function() {
			         var m_seq = $('#m_seq').val();
			         location.href("mailDetailDelete?m_seq="+m_seq);            
			      });
			   });
			 
			  $('#deleteall').on('click', function() {
					$("input[type=checkbox]").prop("checked",true);
					$('.modal-body').text("전부 삭제 하시겠습니까?");
				      $('#commonuse').text("확인");
				      $('#commonmodal').modal('show');
				      $('#commonuse').show();
				      $('#commoncancel').show();
				      $('#commonclose').hide();
			          var checkbox = $("input[name=mailcheckbox]:checked");		          
			          // 체크된 체크박스 값을 가져온다
			          $('#commonuse').on('click', function() {
			          checkbox.each(function(i) {  
			              // checkbox.parent() : checkbox의 부모는 <td>이다.
			              // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			              var tr = checkbox.parent().parent().eq(i);
			              var td = tr.children();
			              // 체크된 row의 모든 값을 배열에 담는다.
			              // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			              var m_seq = td.eq(0).text()+"";      
			              // 가져온 값을 배열에 담는다. 
			      		$.ajax({
							url: "mailDelete",
							type: "POST",
							data: {m_seq:m_seq},
							success:function(data){
					            var msg = "이메일이 전부 삭제되었습니다!";
					            $('.modal-body').text(msg);
					            $('#commonuse').show();
					            $('#commoncancel').hide();
					            $('#commonclose').hide();
					            $('#commonmodal').modal('show');
					            $('#commonuse').on('click', function() {
					                  $('#commonmodal').modal('hide');
					                  location.reload();
					                  return;
					               });
							},
							error : function(request,status,error) {
			                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			             }
						});
			          });
			          });
			   });
		});