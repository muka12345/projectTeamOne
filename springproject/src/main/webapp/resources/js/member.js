function imageChange() {
	var input = document.getElementById("fileid");
	var fReader = new FileReader();
	fReader.readAsDataURL(input.files[0]);
	fReader.onloadend = function(event) {
		var img = document.getElementById("imgid");
		img.src = event.target.result;
	}
}

function inputTelNumber(obj) {

	var number = obj.value.replace(/[^0-9]/g, "");
	var tel = "";

	// 서울 지역번호(02)가 들어오는 경우
	if (number.substring(0, 2).indexOf('02') == 0) {
		if (number.length < 3) {
			return number;
		} else if (number.length < 6) {
			tel += number.substr(0, 2);
			tel += "-";
			tel += number.substr(2);
		} else if (number.length < 10) {
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
		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			tel += number.substr(0, 3);
			tel += "-";
			tel += number.substr(3);
		} else if (number.length < 11) {
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

function goSearchome() {
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
			document.getElementById('addr').value = data.zonecode; // 5자리
			// 새우편번호
			// 사용
			document.getElementById('addr1').value = fullAddr;
			// 커서를 상세주소 필드로 이동한다.
		}
	}).open();
}

function Searchome() {
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
			document.getElementById('addr').value = data.zonecode; // 5자리
			// 새우편번호
			// 사용
			document.getElementById('addr1').value = fullAddr;
			// 커서를 상세주소 필드로 이동한다.
		}
	}).open();
}

$(document)
		.ready(
				function() {
					$('#comeWork').on('click', function() {
						$('#work_Check_Form').attr('action', "workCheckForm");
						$('#work_Check_Form').submit();
					});
					$('#offWork').on('click', function() {
						$('#work_Check_Form').attr('action', "offworkCheck");
						$('#work_Check_Form').submit();
					});

					$('button[name=btndelete]')
							.on(
									'click',
									function() {
										var currentRow = $(this).closest("tr");
										var empno = currentRow.find("td:eq(2)")
												.text();
										$('.modal-body').text("삭제 하시겠습니까?");
										$('#commonuse').text("확인");
										$('#commonmodal').modal('show');
										$('#commonuse').show();
										$('#commoncancel').show();
										$('#commonclose').hide();
										$('#commonuse')
												.on(
														'click',
														function() {
															$
																	.ajax({
																		type : 'POST',
																		data : {
																			empno : empno
																		},
																		datatype : 'json',
																		url : 'memberDelete',
																		success : function(
																				data) {
																			currentRow
																					.remove();
																			var msg = "삭제 되지않았습니다!";
																			if (data == "1")
																				msg = "삭제 되었습니다!";
																			$(
																					'.modal-body')
																					.text(
																							msg);
																			$(
																					'#commonuse')
																					.hide();
																			$(
																					'#commoncancel')
																					.hide();
																			$(
																					'#commonclose')
																					.show();
																			$(
																					'#commonmodal')
																					.modal(
																							'show');
																			$(
																					'#commonuse')
																					.on(
																							'click',
																							function() {
																								$(
																										'#commonmodal')
																										.modal(
																												'hide');
																								return;
																							});
																		},
																		error : function(
																				request,
																				status,
																				error) {
																			alert("code:"
																					+ request.status
																					+ "\n"
																					+ "message:"
																					+ request.responseText
																					+ "\n"
																					+ "error:"
																					+ error);
																		}
																	});
															return;
														});
									});

					$('button[name=btnmodify]')
							.on(
									'click',
									function() {
										var currentRow = $(this).closest("tr");
										var empno = currentRow.find("td:eq(2)")
												.text();
										var depart = currentRow.find(
												"td:eq(3) input[type='text']")
												.val();
										var position = currentRow.find(
												"td:eq(4) input[type='text']")
												.val();

										$('.modal-body').text("수정 하시겠습니까?");
										$('#commonuse').text("확인");
										$('#commonmodal').modal('show');
										$('#commonuse').show();
										$('#commoncancel').show();
										$('#commonclose').hide();
										$('#commonuse')
												.on(
														'click',
														function() {
															$
																	.ajax({
																		type : 'POST',
																		data : {
																			empno : empno,
																			depart : depart,
																			position : position
																		},
																		datatype : 'json',
																		url : 'memberModify',
																		success : function(
																				data) {
																			var msg = "수정 되지않았습니다!";
																			if (data == "1")
																				msg = "수정 되었습니다!";
																			$(
																					'.modal-body')
																					.text(
																							msg);
																			$(
																					'#commonuse')
																					.hide();
																			$(
																					'#commoncancel')
																					.hide();
																			$(
																					'#commonclose')
																					.show();
																			$(
																					'#commonmodal')
																					.modal(
																							'show');
																			$(
																					'#commonuse')
																					.on(
																							'click',
																							function() {
																								$(
																										'#commonmodal')
																										.modal(
																												'hide');
																								return;
																							});
																		},
																		error : function(
																				xhr,
																				status,
																				error) {
																			alert('error');
																		}
																	});
															return;
														});
									});
					$('#btnempno')
							.on(
									'click',
									function() {
										var empno = $('#empno').val();
										if (empno == 0) {
											$('.modal-body').text("코드를 입력하세요.");
											$('#commonuse').text("확인");
											$('#commonmodal').modal('show');
											return;
										} else {
											$
													.ajax({
														type : 'POST',
														data : "empno=" + empno,
														datatype : 'json',
														url : 'memberConfirm',
														success : function(data) {
															$('.modal-title')
																	.text(
																			"코드 중복 검사");
															$('#commonuse')
																	.show();
															$('#commoncancel')
																	.show();
															if (data == 'y') {
																$('.modal-body')
																		.text(
																				"사용중인 코드입니다.");

																$('#commonuse')
																		.text(
																				"확인");
																$(
																		'#commoncancel')
																		.hide();
																$(
																		'#commonmodal')
																		.modal(
																				'show');

																$('#commonuse')
																		.on(
																				'click',
																				function() {
																					$(
																							'#empno')
																							.val(
																									"");
																					$(
																							'#empno')
																							.get(
																									0)
																							.focus();
																					return;
																				});

															} else {
																$('.modal-body')
																		.text(
																				"사용가능한 코드입니다.");
																$(
																		'#commoncancel')
																		.text(
																				"확인");
																$('#commonuse')
																		.hide();
																$(
																		'#commonmodal')
																		.modal(
																				'show');
																$(
																		'#commoncancel')
																		.on(
																				'click',
																				function() {
																					$(
																							'#empnoExists')
																							.val(
																									"y");
																					$(
																							'#empnoError')
																							.text(
																									"");
																					$(
																							'#name')
																							.focus();
																				});
															}
														},
														error : function(
																request,
																status, error) {
															alert("code:"
																	+ request.status
																	+ "\n"
																	+ "message:"
																	+ request.responseText
																	+ "\n"
																	+ "error:"
																	+ error);
														}
													});
										}
									});
				});