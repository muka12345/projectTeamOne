$(document).ready(function() {
	$('#paytable #checkBox').on('click', function() {
	if ($('#checkBox').prop("checked")) {
	$("input[type=checkbox]").prop("checked", true);
	} else {
	$("input[type=checkbox]").prop("checked", false);
		}
	});
	$('#deletebtn').on('click',function() {
		var checkbox = $("input[name=sign]:checked");
		checkbox.each(function(i) {
			tr = checkbox.parent().parent().eq(i);
			td = tr.children();
				var empno = td.eq(2).text();
				var fullattendpay = td.eq(8).children().find('input').val();
				var teampay = td.eq(9).children().find('input').val();
				var ricepay = td.eq(10).children().find('input').val();
				var supportpay = td.eq(11).children().find('input').val();
				var accurerest = td.eq(12).children().find('input').val();
				var monthrest = td.eq(13).children().find('input').val();
				var moverest = td.eq(14).children().find('input').val();
					$('.modal-body').text("삭제 하시겠습니까?");
					$('#commonuse').text("확인");
					$('#commonmodal').modal('show');
					$('#commonuse').show();
					$('#commoncancel').show();
					$('#commonclose').hide();
					$('#commonuse').on('click',function() {
						$.ajax({
							type : 'POST',
							data : {
							empno : empno,
							},
							datatype : 'json',
							url : 'payDelete',
							success : function(data) {
								var msg = "삭제 되지않았습니다!";
								if (data == "1")
								msg = "삭제 되었습니다!";
									tr.remove();
									$('.modal-body').text(msg);
									$('#commonuse').hide();
									$('#commoncancel').hide();
									$('#commonclose').show();
									$('#commonmodal').modal('show');
									$('#commonuse').on('click',function() {
										$('#commonmodal').modal('hide');
											return;
										});
									},
									error : function(xhr,status,error) {
									alert("code:"+ request.status+ "\n"+ "message:"
											+ request.responseText+ "\n"+ "error:"+ error);
									}
							})
					});
			});
		});
	
	$('#updatebtn').on('click',function() {
		var checkbox = $("input[name=sign]:checked");
		checkbox.each(function(i) {
			tr = checkbox.parent().parent().eq(i);
			td = tr.children();
				var date = td.eq(1).text();
				var empno = td.eq(2).text();
				var name = td.eq(3).text();
				var depart = td.eq(4).text();
				var position = td.eq(5).text();
				var basicpay = td.eq(6).text();
				var incentive = td.eq(7).text();
				var fullattendpay = td.eq(8).children().find('input').val();
				var teampay = td.eq(9).children().find('input').val();
				var ricepay = td.eq(10).children().find('input').val();
				var supportpay = td.eq(11).children().find('input').val();
				var accurerest = td.eq(12).children().find('input').val();
				var monthrest = td.eq(13).children().find('input').val();
				var moverest = td.eq(14).children().find('input').val();
					$('.modal-body').text("수정 하시겠습니까?");
					$('#commonuse').text("확인");
					$('#commonmodal').modal('show');
					$('#commonuse').show();
					$('#commoncancel').show();
					$('#commonclose').hide();
					$('#commonuse').on('click',function() {
						$.ajax({
							type : 'POST',
							data : {
								empno : empno,
								fullattendpay : fullattendpay,
								teampay : teampay,
								ricepay : ricepay,
								supportpay : supportpay,
								accurerest : accurerest,
								monthrest : monthrest,
								moverest : moverest
								},
								datatype : 'json',
								url : 'payUpdate',
								success : function(data) {
									var msg = "수정 되지않았습니다!";
									if (data == "1")
									msg = "수정 되었습니다!";
										$('.modal-body').text(msg);
										$('#commonuse').hide();
										$('#commoncancel').hide();
										$('#commonclose').show();
										$('#commonmodal').modal('show');
										$('#commonuse').on('click',function() {
										$('#commonmodal').modal('hide');
											return;
												});
											},
											error : function(xhr,status,error) {
												alert("code:"+ request.status+ "\n"+ "message:"
																				+ request.responseText+ "\n"+ "error:"+ error);
															}
														})
													});	
												});
											});

	$('#board_personnel #allcheck').on('click', function() {
	if ($('#allcheck').prop("checked")) {
		$("input[type=checkbox]").prop("checked", true);
		} else {
		$("input[type=checkbox]").prop("checked", false);
			}
	});
		$('#rowdelete').on('click',function() {
			var checkbox = $("input[name=check]:checked");
			checkbox.each(function(i) {
			trArr = new Array();
			tr = checkbox.parent().parent().eq(i);
			td = tr.children();
			var b_seq = td.eq(1).text();
			var title = td.eq(2).text();
			var category = td.eq(3).text();
			var name = td.eq(4).text();
			var date = td.eq(5).text();
			var lookup = td.eq(6).text();
				('.modal-body').text("삭제 하시겠습니까?");
				$('#commonuse').text("확인");
				$('#commonmodal').modal('show');
				$('#commonuse').show();
				$('#commoncancel').show();
				$('#commonclose').hide();
				$('#commonuse').on('click',	function() {
					$.ajax({
						type : 'POST',
						data : {
							b_seq : b_seq
						},
						datatype : 'json',
						url : 'checkboxDelete',
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
							$('#commonuse').on('click',function() {
							$('#commonmodal').modal('hide');
								return;
						});
				},
					error : function(request,status,error) {
							alert("code:"+ request.status+ "\n"+ "message:"+ request.responseText
									+ "\n"+ "error:"+ error);
						}
					})
				});
			});
		});
	});