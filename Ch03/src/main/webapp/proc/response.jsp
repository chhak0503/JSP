<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	// 해당 페이지를 파일 다운로드로 응답
	response.setHeader("Content-Type", "application/octet-stream");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>response 페이지</title>
	</head>
	<body>
		<h3>response 페이지</h3>
		<a href="../2_response.jsp">뒤로가기</a>
	</body>
</html>