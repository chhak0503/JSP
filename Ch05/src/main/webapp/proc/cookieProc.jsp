<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookieProc</title>
	</head>
	<body>
		<h3>쿠키생성 및 전송</h3>
		<%
			request.setCharacterEncoding("UTF-8");
		
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			// 쿠키생성
			Cookie c1 = new Cookie("uid", id);
			Cookie c2 = new Cookie("pass", pw);
			
			c1.setMaxAge(60*60*24);
			c2.setMaxAge(60*60*24);
			
			// 쿠키전송
			response.addCookie(c1);	
			response.addCookie(c2);	
		%>
		
		<h4>쿠키 전송완료...</h4>
		
		<a href="./cookieConfirm.jsp">서버로 쿠키 전송하기</a>
		
	</body>
</html>