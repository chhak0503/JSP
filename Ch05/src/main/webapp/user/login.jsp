<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 자동 로그인 쿠키 유무를 가지고 로그인 성공 페이지로 리다이렉트
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("cid")){
				response.sendRedirect("./loginSuccess.jsp");
			}
		}
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
		<h3>로그인</h3>
		
		<form action="./loginProc.jsp" method="post">
			<input type="text" name="id" placeholder="아이디 입력"/><br/>
			<input type="password" name="pw" placeholder="비밀번호 입력"/><br/>
			<label><input type="checkbox" name="auto" value="1"/>자동로그인</label>
			<input type="submit" value="로그인"/><br/>
		</form>	
		
	</body>
</html>