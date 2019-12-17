$(document).ready(function() {
	$('#AttendancedatePicker1').datepicker({
		format:"yyyy-mm-dd",
		language: "kr",
		todayHighlight: true,
	}).datepicker("setDate", new Date());

	$('#AttendancedatePicker2').datepicker({
		format:"yyyy-mm-dd",
		language: "ko",
		todayHighlight: true
	}).datepicker("setDate", new Date());

	 $("#AttendancedatePicker1").on("dp.change", function (e) {
         $('#AttendancedatePicker2').data("DateTimePicker").minDate(e.date);
     });
     $("#AttendancedatePicker2").on("dp.change", function (e) {
         $('#AttendancedatePicker1').data("DateTimePicker").maxDate(e.date);
     });
});	