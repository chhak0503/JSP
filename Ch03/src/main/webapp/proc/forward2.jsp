<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// forward는 서버 자원 내에서 이동하기 때문에 타 서버 자원으로 forwarding 안됨 
	pageContext.forward("https://naver.com");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forward2</title>
	</head>
	<body>
		<h3>forward2 페이지</h3>
	</body>
</html>