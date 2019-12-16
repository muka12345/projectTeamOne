<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="decorator" content="null" />
<content tag="local_css"> <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="js/gu-upload/css/guupload.css" />

</content>
<title>bootstrap4</title>
</head>
<body>
	<div id="summernote"></div>
	<table>
		<tr>
			<td>Contents</td>
		</tr>
		<tr>
			<td><textarea name="brd_contents" cols="55" rows="5" style="width: 500px;"></textarea></td>
		</tr>
		<tr>
			<td>Attach File</td>
		</tr>
		<tr>
			<td>
				<div id="attachFile" style="width: 500px;"></div>
			</td>
		</tr>
	</table>

	<content tag="local_script"> <script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> <script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> <script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script> <script
		type="text/javascript" src="js/gu-upload/guuploadManager.js"></script> 
		
	<!-- 	<script>
			$('#summernote').summernote({
				placeholder : 'Hello summernote',
				tabsize : 2,
				height : 100,
				lang : 'ko-KR'
			});
		</script>  -->
		
		<script>
			var guManager = null;
			window.onload = function() {
				var option = {
					fileid : "attachFile",
					uploadURL : "upload",
					maxFileSize : 100,
					maxFileCount : 12,
					useButtons : false,
					afterFileTransfer : afterFileTransfer
				}
				guManager = new guUploadManager(option);
			}
		</script> </content>
</body>
</html> --%>