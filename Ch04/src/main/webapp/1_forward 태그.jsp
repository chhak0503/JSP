<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_forward 태그</title>
		<!-- 
			날짜 : 2022/10/07
			이름 : 김철학
			내용 : JSP forward 액션태그 실습하기
		-->
	</head>
	<body>
		<h3>forward 액션태그</h3>
		
		<jsp:forward page="./2_include 태그.jsp"></jsp:forward>
		<%
			//pageContext.forward("./2_include 태그.jsp");		
		%>		
	</body>
</html>