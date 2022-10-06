<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>7_scopeTest</title>
		<!-- 
			날짜 : 2022/10/06
			이름 : 김철학
			내용 : JSP 내장객체와 영역(Scope) 실습하기
		 -->
	</head>
	<body>
		<h3>내장객체 영역</h3>
		
		<h4>각 내장객체 영역 설정</h4>		
		<%
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "이순신");
		%>
		
		<h4>각 내장객체 영역 확인</h4>
		<p>
			pageContext 영역 : <%= pageContext.getAttribute("name") %><br/>
			request 영역 : <%= request.getAttribute("name") %><br/>
			session 영역 : <%= session.getAttribute("name") %><br/>
			application 영역 : <%= application.getAttribute("name") %><br/>			
		</p>
		
		<% 
			//pageContext.forward("./proc/scopeResult.jsp");
		%>		
		
		<a href="./proc/scopeResult.jsp">내장객체 영역 확인</a>				
	</body>
</html>















