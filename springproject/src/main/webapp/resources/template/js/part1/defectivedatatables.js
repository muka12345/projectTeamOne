// Call the dataTables jQuery plugin

$(document).ready(function() {
	var table = $('#dataTable').DataTable({
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
	table.buttons().container().appendTo($('#copyall'));
});
