
function inputTelNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var tel = "";

    // 서울 지역번호(02)가 들어오는 경우
    if(number.substring(0, 2).indexOf('02') == 0) {
        if(number.length < 3) {
            return number;
        } else if(number.length < 6) {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2);
        } else if(number.length < 10) {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2, 3);
            tel += "-";
            tel += number.substr(5);
        } else {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2, 4);
            tel += "-";
            tel += number.substr(6);
        }
    
    // 서울 지역번호(02)가 아닌경우
    } else {
        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3);
        } else if(number.length < 11) {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3, 3);
            tel += "-";
            tel += number.substr(6);
        } else {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3, 4);
            tel += "-";
            tel += number.substr(7);
        }
    }

    obj.value = tel;
}

function imageChange() {
	   var input = document.getElementById("fileid");
	   var fReader = new FileReader();
	   fReader.readAsDataURL(input.files[0]);
	   fReader.onloadend = function(event) {
	      var img = document.getElementById("imgid");
	      img.src = event.target.result;
	   }
	}
	var phone_length = 0;
	function phoneLengthChk(obj, keychk, next_field) {
	   if (keychk == 'up') {
	      if (obj.value.length == 4)
	         next_field.focus();
	   }
	}
	function validateEmail(Email) {
	   var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	   return $.trim(Email).match(pattern) ? true : false;
	}

	function zipcodeFind() {
	   new daum.Postcode({
	      oncomplete : function(data) {
	         var fullAddr = ''; // 최종 주소 변수
	         var extraAddr = ''; // 조합형 주소 변수
	         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	            fullAddr = data.roadAddress;
	         } else { // 사용자가 지번 주소를 선택했을 경우(J)
	            fullAddr = data.jibunAddress;
	         }
	         // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	         if (data.userSelectedType === 'R') {
	            // 법정동명이 있을 경우 추가한다.
	            if (data.bname !== '') {
	               extraAddr += data.bname;
	            }
	            // 건물명이 있을 경우 추가한다.
	            if (data.buildingName !== '') {
	               extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
	                     : data.buildingName);
	            }
	            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	            fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
	         }
	         // 우편번호와 주소 정보를 해당 필드에 넣는다.
	         document.getElementById('zipcode').value = data.zonecode; // 5자리
	         // 새우편번호
	         // 사용
	         document.getElementById('addr1').value = fullAddr;
	         // 커서를 상세주소 필드로 이동한다.
	         document.getElementById('addr2').focus();
	      }
	   }).open();
	}
	function buySelectedAjax(seq){
		$.ajax({
            type : 'POST',
            data : {
              seq:seq
            },
            datatype : 'json',
            url : 'buySelectedAjax',
            success : function(data) {
            	$('#selectvender').val(data.vendcode).prop("selected",true);
            	$('#buysave').hide();
            	$('#buyreset').hide();
            	$('#buyupdate').show();
            	$('#seq').val("value",data.seq);
            	$('#yyyy').val("value",data.yyyy);
            	$('#mm').val("value",data.mm);
            	$('#dd').val("value",data.dd);
            	$('#no').val("value",data.no);
            	$('#hang').val("value",data.hang);
            	$('#selectproduct').val(data.procode).prop("selected",true);
            	$('#beforeprocode').val("value",data.procode);
            	$('#beforeprice').val("value",data.price);
            	$('#beforeqty').val("value",data.qty);
            	$('#name').val("value",data.proname);
            	$('#capacity').val("value",data.capacity);
            	$('#price').val("value",data.price);
            	$('#qty').val("value",data.qty);
            	var amount = data.qty * data.price;
            	$('#amount').val("value",amount);
            	$('#memo').val("value",data.memo);
            	

            },
            error : function(request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
         });
		
	}
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("newaddr").value = roadAddr;
                document.getElementById("oldaddr").value = data.jibunAddress;
                document.getElementById('detailaddr').focus();
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("paypart");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}

//	출처: https://canworld42.tistory.com/25 [깨어 있는 세상]
	function paymentSelectedAjax(seq){
		$.ajax({
            type : 'POST',
            data : {
              seq:seq
            },
            datatype : 'json',
            url : 'paymentSelectedAjax',
            success : function(data) {
            	$('#paymentvender').val(data.vendcode).prop("selected",true);
            	$('#paymentsave').hide();
            	$('#paymentreset').hide();
            	$('#paymentupdate').show();
            	$('#seq').val("value",data.seq);
            	$('#yyyy').val("value",data.yyyy);
            	$('#mm').val("value",data.mm);
            	$('#dd').val("value",data.dd);
            	$('#no').val("value",data.no);
            	$('#hang').val("value",data.hang);
            	var paypart=data.paypart;
            	$('input:checkbox[id="paypart"]').val("checked", true);
            	$('#pay').val("value",data.pay);
            	$('#capacity').val("value",data.capacity);
            	$('#memo').val("value",data.memo);
            	

            },
            error : function(request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
         });
		
	}

	$(document).ready(function() {
	
		var publictr="";
		
		$('#buytable td').on('click',function(){
		      var row = $(this).closest('tr');
		       var tr = row.children();
		       
		       publictr=tr;
		       var no = tr.eq(0).text();
		       var hang = tr.eq(1).text();
		       var seq = tr.eq(2).children().val();
		       var proname = tr.eq(2).children().eq(1).text();
		       var price = tr.eq(3).text();
		       var qty = tr.eq(4).text();
		       var total = tr.eq(5).text();
		       
		});
		       
		$('#paymentsearch_btn').on('click',function(){
			$('#payment_Insert').attr("action","paymentRollupSearch");
		
			$('#payment_Insert').submit();
		});
		$('#paymentvender').on('change',function(){
			if ('0000' !== $('#paymentvender').val()) {	
				$.ajax({
		            type : 'POST',
		            data : {
		              code:$('#paymentvender').val()
		            },
		            datatype : 'json',
		            url : 'paymentNumberCreate',
		            success : function(data) {
		            	$('#vendcode').attr("value",data.vendcode);
		              $('#yyyy').attr("value",data.yyyy);
		              $('#mm').attr("value",data.mm);
		              $('#dd').attr("value",data.dd);
		              $('#no').attr("value",data.no);
		              $('#hang').attr("value",data.hang);
	
		            },
		            error : function(xhr, status, error) {
		               alert('error');
		            }
		         });
			}
			});
		$('#paymentsave').on('click',function(){
			if ('0000' == $('#paymentvender').val()) {
			$('.modal-body').text("매입 회사을 선택하세요");
			$('#commonuse').text("확인");
			$('#commonmodal').modal('show');
			return;
		}	
			$('#payment_Insert').attr("action","paymentInsert");
			$('#payment_Insert').submit();
		});
		
		
		$('#buyupdate').on('click',function(){
			 $('.modal-body').text("수정 하시겠습니까?");
		      $('#commonuse').text("확인");
		      $('#commonmodal').modal('show');
		      $('#commonuse').show();
		      $('#commoncancel').show();
		      $('#commonclose').hide();
		      $('#commonuse').on('click', function() {
		    	  var form ={name:"buy",
							seq:$('#seq').val(),
							vendcode:$('#selectvender').val(),
							yyyy:$('#yyyy').val(),
							mm:$('#mm').val(),
							dd:$('#dd').val(),
							no:$('#no').val(),
							hang:$('#hang').val(),
							procode:$('#selectproduct').val(),
							beforeprocode:$('#beforeprocode').val(),
							price:$('#price').val(),
							beforeprice:$('#beforeprice').val(),
							qty:$('#qty').val(),
							beforeqty:$('#beforeqty').val(),
							memo:$('#memo').val()
							}
			$.ajax({
				url: "buyUpdateAjax",
				type: "POST",
				data: form,
				success:function(data){
					publictr.eq(2).children().eq(1).text($('#name').val());
					publictr.eq(3).text($('#price').val());
					publictr.eq(4).text($('#qty').val());
					publictr.eq(5).text($('#amount').val());
					$('#selectvender').val("0000").prop("selected",true);
					$('#selectproduct').val("0000000000000").prop("selected",true);
					publictr.eq(3).text($('#price').val());
					$('#name').val("");
					$('#capacity').val("");
					$('#seq').val("");
					$('#yyyy').val("");
					$('#mm').val("");
					$('#dd').val("");
					$('#no').val("");
					$('#hang').val("");
	
					$('#price').val("");
					$('#qty').val("");
					$('#amount').val("");
					$('#memo').val("");
		            var msg = "수정 되었습니다!";
		            $('.modal-body').text(msg);
		            $('#commonuse').hide();
		            $('#commoncancel').hide();
		            $('#commonclose').show();
		            $('#commonmodal').modal('show');
		            $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  return;
		               });
				},
				error : function(request,status,error) {
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
			});
		
			
		});
		
	   });
		
		$('#qty').keyup(function(){
			var amount = $('#price').val() * $('#qty').val();
			$('#amount').val("value",amount);
			
		
		});
		
		$('#selectvender').on('change',function(){
			if ('0000' !== $('#selectvender').val()) {	
				$.ajax({
		            type : 'POST',
		            data : {
		              code:$('#selectvender').val()
		            },
		            datatype : 'json',
		            url : 'buyNumberCreate',
		            success : function(data) {
		            	$('#vendcode').val("value",data.vendcode);
		              $('#yyyy').val("value",data.yyyy);
		              $('#mm').val("value",data.mm);
		              $('#dd').val("value",data.dd);
		              $('#no').val("value",data.no);
		              $('#hang').val("value",data.hang);
	
		            },
		            error : function(xhr, status, error) {
		               alert('error');
		            }
		         });
			}
			});
		$('#selectproduct').on('change',function(){
			if ('0000000000000' !== $('#selectproduct').val()) {	
				$.ajax({
		            type : 'POST',
		            data : {
		              code:$('#selectproduct').val()
		            },
		            datatype : 'json',
		            url : 'productGetInfo',
		            success : function(data) {
		            	  $('#name').val("value",data.name);
			              $('#capacity').val("value",data.capacity);
			              $('#price').val("value",data.buyprice);
			              $('#stock').val("value",data.stock);
			              $('#qty').focus();
	
		            },
		            error : function(xhr, status, error) {
		               alert('error');
		            }
		         });
			}
			});
			
		$('#buysave').on('click',function(){
			if ('0000' == $('#selectvender').val()) {
			$('.modal-body').text("매입 상품을 선택하세요");
			$('#commonuse').text("확인");
			$('#commonmodal').modal('show');
			return;
		} else if ('0000000000000' == $('#selectproduct').val()) {
			$('.modal-body').text("매입 상품을 선택하세요");
			$('#commonuse').text("확인");
			$('#commonmodal').modal('show');
			return;
		}
			
			$('#buy_Insert').attr("action","buyInsert");
			$('#buy_Insert').submit();


	});	
		$('#buysearch_btn').on('click',function(){
			$('#buy_Insert').attr("action","buyRollupSearch");
			$('#qty').attr("required",false);
			$('#buy_Insert').submit();
		});
		
	$('#salarycreative').on('click', function() {
		 $('.modal-body').text("데이터가 삭제됩니다! 생성하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonuse').on('click', function() {
	    	$('#salary_creative_form').attr("action","salaryTax");
	    	$('#salary_creative_form').submit();
	      });

	
	});
	$('#salarydelete').on('click', function() {
		$('.modal-body').text("데이터가 삭제됩니다! 삭제하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonuse').on('click', function() {
		$('#salary_creative_form').attr("action","salaryTaxDelete");
		$('#salary_creative_form').submit();
	      });
	
	});

	$('#discussionsave').on('click', function() {
		if ($('#r_content').val() == "") {
			return;
		}
		$('#discussionInsert').submit();
	});
	   $('#articledel').on('click', function() {
	      $('.modal-body').text("삭제 하시겠습니까?");
	      $('#commonuse').text("확인");
	      $('#commonmodal').modal('show');
	      $('#commonuse').show();
	      $('#commoncancel').show();
	      $('#commonclose').hide();
	      $('#commonuse').on('click', function() {
	         var b_seq = $('#b_seq').val();
	         location.href("articleDelete?b_seq="+b_seq);
	      });
	   });
	   $('#levelnewbtn button').on('click', function() {
	      var currentRow = $(this).closest("tr");
	      var email = currentRow.find("td:eq(1)").text();
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
	               email : email
	            },
	            datatype : 'json',
	            url : 'memberDeleteAjax',
	            success : function(data) {
	               currentRow.remove();
	               var msg = "삭제 되지않았습니다!";
	               if (data == "1")
	                  msg = "삭제 되었습니다!";
	               $('.modal-body').text(msg);
	               $('#commonuse').hide();
	               $('#commoncancel').hide();
	               $('#commonclose').show();
	               $('#commonmodal').modal('show');
	               $('#commonuse').on('click', function() {
	                  $('#commonmodal').modal('hide');
	                  return;
	               });

	            },
	            error : function(xhr, status, error) {
	               alert('error');
	            }
	         });
	         return;
	      });
	   });
	   $('#levelupbtn button').on('click', function() {
	      var currentRow = $(this).closest("tr");
	      var email = currentRow.find("td:eq(1)").text();
	      var memlevel = currentRow.find("td:eq(4) input[type='text']").val();
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
	               email : email,
	               memlevel : memlevel
	            },
	            datatype : 'json',
	            url : 'memlevelChange',
	            success : function(data) {
	               var msg = "수정 되지않았습니다!";
	               if (data == "1")
	                  msg = "수정 되었습니다!";
	               $('.modal-body').text(msg);
	               $('#commonuse').hide();
	               $('#commoncancel').hide();
	               $('#commonclose').show();
	               $('#commonmodal').modal('show');
	               $('#commonuse').on('click', function() {
	                  $('#commonmodal').modal('hide');
	                  return;
	               });

	            },
	            error : function(xhr, status, error) {
	               alert('error');
	            }
	         });
	         return;
	      });

	      $('#commoncancel').on('click', function() {
	         $('#commonmodal').modal('hide');
	         return;
	      });
	   });

	   $('#passwordfind').on('click', function() {
	      var email = $('#email').val();
	      var name = $('#name').val();
	      var emailchk = validateEmail(email);

	      if (email == "") {
	         $('.modal-body').text("E-mail을 입력하세요.");
	         $('#commonuse').text("확인");
	         $('#commonmodal').modal('show');
	         return;
	      }
	      if (name == "") {
	         $('.modal-body').text("이름을 입력하세요.");
	         $('#commonuse').text("확인");
	         $('#commonmodal').modal('show');
	         return;
	      }

	      if (!emailchk) {
	         $('.modal-body').text("E-mail 형식을 확인하세요.");
	         $('#commonuse').text("확인");
	         $('#commonmodal').modal('show');
	         return;
	      } else {

	         $.ajax({
	            type : 'POST',
	            data : {
	               email : email,
	               name : name
	            },
	            datatype : 'json',
	            url : 'findPassword',
	            success : function(data) {
	               if (data == 'y') {
	                  $('.spinbar').show();
	                  location.href = "sendNewPassword?email=" + email;
	               } else {
	                  $('.modal-body').text("정보가 정확하지않습니다.");
	                  $('#commoncancel').text("확인");
	                  $('#commonuse').hide();
	                  $('#commonmodal').modal('show');
	                  $('#commoncancel').on('click', function() {
	                     $('#commonmodal').modal('hide');
	                  });
	               }

	            },
	            error : function(xhr, status, error) {
	               alert('error');
	            }
	         });
	      }
	   });
	   $('#salaryconfirm').on('click', function() {
		   var empno=$('#empno').val();
		   if (empno == "") {
		         $('.modal-body').text("사원번호를 입력하세요.");
		         $('#commonuse').text("확인");
		         $('#commonmodal').modal('show');
		         return;
		   }else{
			   $.ajax({
		            type : 'POST',
		            data : "empno=" + empno,
		            datatype : 'json',
		            url : 'salaryConfirm',
		            success : function(data) {
		            	 $('.modal-title').text("사원번호 중복 검사");
			               $('#commonuse').show();
			               $('#commoncancel').show();
			               if (data == 'y') {
			                  $('.modal-body').text("사용중인 사원번호입니다.");

			                  $('#commonuse').text("확인");
			                  $('#commoncancel').hide();
			                  $('#commonmodal').modal('show');

			                  $('#commonuse').on('click', function() {
			                     $('#empno').val("");
			                     $('#empno').get(0).focus();
			                     return;
			                  });
			               }else{
			            	   $('.modal-body').text("사용가능한 사원번호입니다.");
				            
				                  $('#commoncancel').text("확인");
				                  $('#commonuse').hide();
				                  $('#commonmodal').modal('show');

				                  $('#commoncancel').on('click', function() {
				                     $('#empnoexists').val("y");
				                     $('#empnoError').text("");
				                     
				                     $('#name').focus();
				                  });
			               }
		            },
		            error : function(xhr, status, error) {
		            	alert('error');
		            }
			   });
			   
		   }
	   });
	   
	   
	   
	   
	   $('#confirm').on('click', function() {
	      var email = $('#email').val();
	      var emailchk = validateEmail(email);

	      if (email == "") {
	         $('.modal-body').text("E-mail을 입력하세요.");
	         $('#commonuse').text("확인");
	         $('#commonmodal').modal('show');
	         return;
	      }
	      if (!emailchk) {
	         $('.modal-body').text("E-mail 형식을 확인하세요.");
	         $('#commonuse').text("확인");
	         $('#commonmodal').modal('show');
	         return;
	      } else {
	         $.ajax({
	            type : 'POST',
	            data : "email=" + email,
	            datatype : 'json',
	            url : 'confirm',
	            success : function(data) {
	               $('.modal-title').text("E-mail 중복 검사");
	               $('#commonuse').show();
	               $('#commoncancel').show();
	               if (data == 'y') {
	                  $('.modal-body').text("사용중인 E-mail입니다.");

	                  $('#commonuse').text("확인");
	                  $('#commoncancel').hide();
	                  $('#commonmodal').modal('show');

	                  $('#commonuse').on('click', function() {
	                     $('#email').val("");
	                     $('#email').get(0).focus();
	                     return;
	                  });

	               } else {
	                  $('.modal-body').text("사용가능한 E-mail입니다.");
	                  $('#commoncancel').text("확인");
	                  $('#commonuse').hide();
	                  $('#commonmodal').modal('show');
	                  $('#commoncancel').on('click', function() {
	                     $('#emailexists').val("y");
	                     $('#emailError').text("");
	                     $('#name').focus();
	                  });
	               }
	            },
	            error : function(xhr, status, error) {
	            }
	         });
	      }

	   });
	   $('#minus').on('click', function() {
	      $('#b_attachbefore').val('');
	   });
	});
	   $('#venderdelbtn button').off("click").on('click', function() {
		   var currentRow = $(this).closest("tr");
		    var code = currentRow.find("td:eq(0)").text();
		      $('.modal-body').text("삭제 하시겠습니까?");
		      $('#commonuse').text("확인");
		      $('#commonmodal').modal('show');
		      $('#commonuse').show();
		      $('#commoncancel').show();
		      $('#commonclose').hide();
		      $('#commonuse').on('click', function() {
		         $.ajax({
		            type : 'POST',
		            data :{
		            	code:code,
		            },
		            datatype : 'json',
		            url : 'venderDeleteAjax',
		            success : function(data) {
		               currentRow.remove();
		               var msg = "삭제 되지않았습니다!";
		               if (data == "1")
		                  msg = "삭제 되었습니다!";
		               $('.modal-body').text(msg);
		               $('#commonuse').hide();
		               $('#commoncancel').hide();
		               $('#commonclose').show();
		               $('#commonmodal').modal('show');
		               $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  return;
		               });

		            },
		            error : function(request,status,error) {
		            	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		         });
		         return;
		      });
		   });
	   $('#codeconfirm').on('click', function() {
		   var code=$('#code').val();
		   if (code == "") {
		         $('.modal-body').text("상품코드를 입력하세요.");
		         $('#commonuse').text("확인");
		         $('#commonmodal').modal('show');
		         return;
		   }else{
			   $.ajax({
		            type : 'POST',
		            data : "code=" + code,
		            datatype : 'json',
		            url : 'codeConfirm',
		            success : function(data) {
		            	 $('.modal-title').text("상품코드 중복 검사");
			               $('#commonuse').show();
			               $('#commoncancel').show();
			               if (data == 'y') {
			                  $('.modal-body').text("사용중인 상품코드입니다.");

			                  $('#commonuse').text("확인");
			                  $('#commoncancel').hide();
			                  $('#commonmodal').modal('show');

			                  $('#commonuse').on('click', function() {
			                     $('#code').val("");
			                     $('#code').get(0).focus();
			                     return;
			                  });
			               }else{
			            	   $('.modal-body').text("사용가능한 상품코드입니다.");
				            
				                  $('#commoncancel').text("확인");
				                  $('#commonuse').hide();
				                  $('#commonmodal').modal('show');

				                  $('#commoncancel').on('click', function() {
				                     $('#codeexists').val("y");
				                     $('#codeError').text("");
				                     
				                     $('#name').focus();
				                  });
			               }
		            },
		            error : function(xhr, status, error) {
		            	alert('error');
		            }
			   });
			   
		   }
	   });
	   $('#productcodeconfirm').on('click', function() {
		   var code=$('#code').val();
		   if (code == "") {
		         $('.modal-body').text("상품코드를 입력하세요.");
		         $('#commonuse').text("확인");
		         $('#commonmodal').modal('show');
		         return;
		   }else{
			   $.ajax({
		            type : 'POST',
		            data : "code=" + code,
		            datatype : 'json',
		            url : 'productcodeConfirm',
		            success : function(data) {
		            	 $('.modal-title').text("상품코드 중복 검사");
			               $('#commonuse').show();
			               $('#commoncancel').show();
			               if (data == 'y') {
			                  $('.modal-body').text("사용중인 상품코드입니다.");

			                  $('#commonuse').text("확인");
			                  $('#commoncancel').hide();
			                  $('#commonmodal').modal('show');

			                  $('#commonuse').on('click', function() {
			                     $('#code').val("");
			                     $('#code').get(0).focus();
			                     return;
			                  });
			               }else{
			            	   $('.modal-body').text("사용가능한 상품코드입니다.");
				            
				                  $('#commoncancel').text("확인");
				                  $('#commonuse').hide();
				                  $('#commonmodal').modal('show');

				                  $('#commoncancel').on('click', function() {
				                     $('#productcodeexists').val("y");
				                     $('#productcodeError').text("");
				                     
				                     $('#name').focus();
				                  });
			               }
		            },
		            error : function(xhr, status, error) {
		            	alert('error');
		            }
			   });
			   
		   }
	   });
	   $('#productdelbtn button').on('click', function() {
		   var checkbox= $('input[id=productcheckbox]:checked');
		   var tr=checkbox.parent().parent();
		   var td=tr.children();
		   var code = td.eq(1).children().val();
		   if (code == "") {
		         $('.modal-body').text("체크박스를 확인하세요");
		         $('#commonuse').text("확인");
		         $('#commonmodal').modal('show');
		         return;
		   }
		      $('.modal-body').text("삭제 하시겠습니까?");
		      $('#commonuse').text("확인");
		      $('#commonmodal').modal('show');
		      $('#commonuse').show();
		      $('#commoncancel').show();
		      $('#commonclose').hide();
		      $('#commonuse').on('click', function() {
		         $.ajax({
		            type : 'POST',
		            data :{
		            	code:code,
		            },
		            datatype : 'json',
		            url : 'productDeleteAjax',
		            success : function(data) {
		               tr.remove();
		               var msg = "삭제 되지않았습니다!";
		               if (data == "1")
		                  msg = "삭제 되었습니다!";
		               $('.modal-body').text(msg);
		               $('#commonuse').hide();
		               $('#commoncancel').hide();
		               $('#commonclose').show();
		               $('#commonmodal').modal('show');
		               $('#commonuse').on('click', function() {
		                  $('#commonmodal').modal('hide');
		                  return;
		               });

		            },
		            error : function(request,status,error) {
		            	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		         });
		         return;
		      });
		   });
	   $('#balancedel').on('click', function() {
		   $('.modal-body').text("삭제 하시겠습니까?");
		      $('#commonuse').text("확인");
		      $('#commonmodal').modal('show');
		      $('#commonuse').show();
		      $('#commoncancel').show();
		      $('#commonclose').hide();
		      $('#commonuse').on('click', function() {
		         var vendcode = $('#vendcode').val();
		         location.href("balanceDelete?vendcode="+vendcode);
		      });
		   });
	   $('#productmodifybtn').on('click', function() {
		      var checkbox =  $('input[id=productcheckbox]:checked');
		      var tr = checkbox.parent().parent();
		      var td = tr.children();
		      checkbox.each(function(i){
		         tr = checkbox.parent().parent().eq(i);
		         td = tr.children();
		            var code = td.eq(1).children().val();
		             var name = td.eq(2).children().val();
		             var preyystock = td.eq(3).children().val();
		             var buy01=td.eq(5).children().children().eq(0).val();
		             var buy02=td.eq(6).children().children().eq(0).val();
		             var buy03=td.eq(7).children().children().eq(0).val();
		             var buy04=td.eq(8).children().children().eq(0).val();
		             var buy05=td.eq(9).children().children().eq(0).val();
		             var buy06=td.eq(10).children().children().eq(0).val();
		             var buy07=td.eq(11).children().children().eq(0).val();
		             var buy08=td.eq(12).children().children().eq(0).val();
		             var buy09=td.eq(13).children().children().eq(0).val();
		             var buy10=td.eq(14).children().children().eq(0).val();
		             var buy11=td.eq(15).children().children().eq(0).val();
		             var buy12=td.eq(16).children().children().eq(0).val();
		             var sale01=td.eq(5).children().children().eq(1).val();
		             var sale02=td.eq(6).children().children().eq(1).val();
		             var sale03=td.eq(7).children().children().eq(1).val();
		             var sale04=td.eq(8).children().children().eq(1).val();
		             var sale05=td.eq(9).children().children().eq(1).val();
		             var sale06=td.eq(10).children().children().eq(1).val();
		             var sale07=td.eq(11).children().children().eq(1).val();
		             var sale08=td.eq(12).children().children().eq(1).val();
		             var sale09=td.eq(13).children().children().eq(1).val();
		             var sale10=td.eq(14).children().children().eq(1).val();
		             var sale11=td.eq(15).children().children().eq(1).val();
		             var sale12=td.eq(16).children().children().eq(1).val();
		             var stock=td.eq(17).children().val();
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
		               code : code,
		               name : name,
		               preyystock  : preyystock,
		               buy01 : buy01,
		               buy02 : buy02,
		               buy03 : buy03,
		               buy04 : buy04,
		               buy05 : buy05,
		               buy06 : buy06,
		               buy07 : buy07,
		               buy08 : buy08,
		               buy09 : buy09,
		               buy10 : buy10,
		               buy11 : buy11,
		               buy12 : buy12,
		               sale01 : sale01,
		               sale02 : sale02,
		               sale03 : sale03,
		               sale04 : sale04,
		               sale05 : sale05,
		               sale06 : sale06,
		               sale07 : sale07,
		               sale08 : sale08,
		               sale09 : sale09,
		               sale10 : sale10,
		               sale11 : sale11,
		               sale12 : sale12,
		               stock : stock
		            },
		            datatype : 'json',
		            url : 'productModify',
		            success : function(data) {
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
		                  alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		         });
		         return;
		      });
		   });
		   });
