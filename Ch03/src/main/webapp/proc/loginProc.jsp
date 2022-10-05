<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login 처리 페이지</title>
	</head>
	<body>
		<h3>로그인 처리 페이지</h3>
		<p>
			아이디 : <%= uid %><br/>
			비밀번호 : <%= pass %>
		</p>
		
		<a href="../1_request 객체.jsp">뒤로가기</a>
		
	</body>
</html>