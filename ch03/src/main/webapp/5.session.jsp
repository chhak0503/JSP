<%@page import="sub1.UserDTO"%>
<%@page import="org.apache.catalina.UserDatabase"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5.session</title>
		<!-- 
			날짜 : 2024/01/31
			이름 : 김철학
			내용 : session 내장객체 실습하기
		-->
	</head>
	<body>
		<h3>5.session 내장객체 실습</h3>
		
		<h4>session ID 확인</h4>
		<%= session.getId() %>
		
		<h4>session 설정</h4>
		<%
			String agent = request.getHeader("User-Agent");
		
			if(agent.contains("Edg")){
				UserDTO user = new UserDTO("a101", "김유신", 23, "경주");
				
				// session 값 설정
				session.setAttribute("user", user);
				
			}else{
				UserDTO user = new UserDTO("a102", "김춘추", 21, "김해");
				
				// session 값 설정
				session.setAttribute("user", user);
			}
			
			// session 값 반환
			UserDTO userDTO = (UserDTO) session.getAttribute("user");
		%>
		<p>
			아이디 : <%= userDTO.getUid() %><br>
			이름 : <%= userDTO.getName() %><br>
			나이 : <%= userDTO.getAge() %><br>
			주소 : <%= userDTO.getAddr() %><br>
		</p>
		
	</body>
</html>