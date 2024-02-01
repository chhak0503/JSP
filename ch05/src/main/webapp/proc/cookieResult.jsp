<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookieResult</title>
	</head>
	<body>
		<h3>쿠키확인</h3>
		
		<%
			Cookie[] cookies = request.getCookies();
		
			for(Cookie cookie : cookies){
		%>
			<p>
				쿠키명 : <%= cookie.getName() %><br>
				쿠키값 : <%= cookie.getValue() %><br>
			</p>
		<%
			}
		%>
		
		<a href="../1.Cookie.jsp">처음으로</a>
		
		
	</body>
</html>