<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>responseFile</title>
	</head>
	<body>
		<h3>responseFile 페이지</h3>
		<%
			response.setHeader("Content-Type", "application/octet-stream");
		%>
	</body>
</html>