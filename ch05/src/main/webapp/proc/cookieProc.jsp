<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookieProc</title>
	</head>
	<body>
		<h3>쿠키생성</h3>
		<%
			request.setCharacterEncoding("UTF-8");
		
			String uid  = request.getParameter("uid");
			String pass = request.getParameter("pass");
			
			// 쿠키생성
			Cookie c1 = new Cookie("cid", uid);
			c1.setMaxAge(60 * 1);
			
			Cookie c2 = new Cookie("cpw", pass);
			c2.setMaxAge(60 * 3);

			// 쿠키전송
			response.addCookie(c1);
			response.addCookie(c2);
		%>
		
		<a href="./cookieResult.jsp">쿠키확인</a>
		
		
	</body>
</html>