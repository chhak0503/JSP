<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_application</title>
		<!-- 
			날짜 : 2022/10/06
			이름 : 김철학
			내용 : JSP application 내장객체 실습하기	
			
			application 내장객체
			 - 현재 웹 애플리케이션을 실행하는 서버 환경(WAS)에 대응하는 객체
			 - 서버 설정 환경값(Context)을 참조하고 로그 작업을 지원 
			
		 -->
	</head>
	<body>
		<h3>application 객체</h3>
		
		<h4>서버 정보</h4>		
		<%= application.getServerInfo() %>
		
		<h4>application 파라미터 목록</h4>
		<%
			Enumeration<String> initParams = application.getInitParameterNames();
		
			while(initParams.hasMoreElements()){
				String paramName  = initParams.nextElement();
				String paramValue = application.getInitParameter(paramName);
				
				out.println("파라미터 명 : "+paramName+"<br/>");
				out.println("파라미터 값 : "+paramValue+"<br/>");
			}
		%>
		
		<h4>로그 기록</h4>
		<%
			application.log("로그 기록 합니다.");
			log("로그1");
		%>		
		
	</body>
</html>