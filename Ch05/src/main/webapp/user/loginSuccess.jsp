<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 자동 로그인 여부에 따라 로그인 처리
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("cid")){
				// 자동 로그인 쿠키값으로 세션id 저장
				session.setAttribute("sessid", cookie.getValue());						
			}			
		}
	}

	String id = (String) session.getAttribute("sessid");
	
	if(id == null){
		response.sendRedirect("./login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginSuccess</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		<p>
			<%= id %>님 반갑습니다.<br/>
			<a href="./logout.jsp">로그아웃</a>		
		</p>
		
	</body>
</html>