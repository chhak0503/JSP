<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_response 객체</title>
		<%--
			날짜 : 2022/10/05
			이름 : 김철학
			내용 : JSP response 내장객체 실습하기
			
			response 내장객체
			 - Client에서 Server로 요청 결과를 응답해주는 객체
			 - Server에서 Client로 전송되는 객체
			 
			redirect
			 - Server에서 Client로 다시 요청을 명령하는 response의 기능
			 - 최종 요청에 대한 주소가 반영, cf) forward는 최초 요청에 대한 주소가 반영
		--%>
	</head>
	<body>
		<h3>response 객체</h3>
		
		<a href="./proc/redirect1.jsp">리다이렉트 페이지 요청1</a>
		<a href="./proc/redirect2.jsp">리다이렉트 페이지 요청2</a>
		<a href="./proc/response.jsp">파일 전송 요청</a>
		
	</body>
</html>