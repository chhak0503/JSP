<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.fileUploadTest</title>
		<!-- 
			날짜 : 2024/02/19
			이름 : 김철학
			내용 : JSP 파일업로드 실습하기
		 -->
	</head>
	<body>
		<h3>1.파일업로드</h3>
		
		<form action="./proc/fileUploadProc.jsp" method="post" enctype="multipart/form-data">
			<input type="text" name="title"><br>
			<input type="text" name="content"><br>
			<input type="file" name="file"><br>
			<input type="submit" value="전송">
		</form>
				
	</body>
</html>