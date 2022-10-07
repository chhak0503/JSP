<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>8_exception</title>
		<!-- 
			날짜 : 2022/10/07
			이름 : 김철학
			내용 : JSP exception 내장객체 실습하기
			
			exception 내장객체
			 - JSP 페이지에서 예외가 발생했을때 생성되는 내장객체
			 - 직접적으로 exception 처리를 하지 않고 에러코드에 따라 에러페이지 작업
			 
			주요 응답상태 코드
			 - 200 : 요청을 정상적으로 처리
			 - 307 : 리다이렉트 응답코드
			 - 401 : 접근을 허용하지 않음
			 - 404 : 요청한 페이지를 찾을 수 없음
			 - 500 : 서버 내부 에러가 발생
			 - 503 : 서버가 일시적으로 서비스를 할 수 없음					
		 -->
	</head>
	<body>
		<h3>exception 객체</h3>
		
		<a href="./9_text.jsp">404 에러 페이지</a>
		<a href="./proc/exception.jsp">5xx 에러 페이지</a>		
		
	</body>
</html>


















