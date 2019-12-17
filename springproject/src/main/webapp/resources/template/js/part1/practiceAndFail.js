$(document).ready(function() {
	// form 통째로 날리기~
	$('#버튼아이뒤').on('click',function(){
	var attenForm = $("from[name=폼네임]").serialize();
	$.ajax({
		type : 'POST',
		data : attenForm,
		datatype : 'json',
		url : '',
		success : function(data) {
			if(data == "1"){
				alert("저장되었습니다.")
			}
		},
		error : function(request,status,error) {
			alert("저장되지 않았습니다.");
			alert("error code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			return;
		}
	});
 });
	// form 통쨰로 날리기~
	
});