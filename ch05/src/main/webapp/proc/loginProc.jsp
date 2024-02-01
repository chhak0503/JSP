<%@page import="sub1.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");

	// abc1234 / 1234 경우 회원으로 간주
	if(uid.equals("abc1234") && pass.equals("1234")){
		// 회원일 경우
		UserDTO user = new UserDTO();
		user.setUid(uid);
		user.setPass(pass);
		user.setName("홍길동");
		user.setAge(23);
		
		// 세션 기록
		session.setAttribute("sessUser", user);
		
		// 이동
		response.sendRedirect("./loginSuccess.jsp");
		
	}else {
		// 회원이 아닐 경우
		response.sendRedirect("../2.Session.jsp?login=fail");
	}
	

%>








