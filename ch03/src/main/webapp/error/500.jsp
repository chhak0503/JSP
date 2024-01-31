<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>일시적인 서버 장애</title>
	</head>
	<body>
		<h3>일시적으로 서버에 문제가 생겼습니다. 잠시 후 다시 요청하시기 바랍니다.</h3>
		<p>
			내용 : <%= exception.getMessage() %>
		</p>
		
		<a href="../6.exception.jsp">뒤로가기</a>
	</body>
</html>