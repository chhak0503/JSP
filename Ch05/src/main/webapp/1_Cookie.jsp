<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_Cookie</title>
		<!-- 
			날짜 : 2022/10/11
			이름 : 김철학
			내용 : JSP Cookie 실습하기
			
			Cookie
			 - 클라이언트와 서버간의 식별을 위해 사용되는 조각파일
			 - 쿠키는 서버에서 생성해서 클라이언트 전송/저장
			 - 클라이언트는 저장된 쿠키를 보관, 해당 서버로 다시 요청할 때 쿠키를 전송 
		-->
	</head>
	<body>
		<h3>Cookie 실습</h3>
		
		<form action="./proc/cookieProc.jsp" method="post">
			<input type="text" name="id" placeholder="아이디 입력"/><br/>
			<input type="password" name="pw" placeholder="비밀번호 입력"/><br/>
			<input type="submit" value="로그인"/><br/>
		</form>	
		
	</body>
</html>