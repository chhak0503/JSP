<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>registerProc</title>
	</head>
	<body>
		<h3>useBean 액션태그</h3>
		
		<%
			request.setCharacterEncoding("UTF-8");
			// 전송 데이터 수신
			/*
			String   name    = request.getParameter("name");
			String   birth   = request.getParameter("birth");
			String   addr    = request.getParameter("addr");
			String   gender  = request.getParameter("gender");
			String[] hobbies = request.getParameterValues("hobby");
			*/
		%>
		<jsp:useBean id="ub" class="bean.UserBean">
			<jsp:setProperty property="name" name="ub"/>
			<jsp:setProperty property="birth" name="ub"/>
			<jsp:setProperty property="addr" name="ub"/>
			<jsp:setProperty property="gender" name="ub"/>
			<jsp:setProperty property="hobbies" name="ub"/>
		</jsp:useBean>
		
		<p>
			이름 : <%= ub.getName() %><br/>
			생년월일 : <%= ub.getBirth() %><br/>
			주소 : <%= ub.getAddr() %><br/>
			성별 : <%= ub.getGender() == 1 ? "남자" : "여자" %><br/>
			취미 : <%= String.join(", ", ub.getHobbies()) %><br/>		
		</p>
		
	</body>
</html>