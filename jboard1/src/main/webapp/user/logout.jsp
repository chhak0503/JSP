<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 현재 사용자 객체 세션 제거 
	session.removeAttribute("sessUser");
	
	// 현재 세션 해제
	session.invalidate();
	
	// 로그인 이동
	response.sendRedirect("/jboard1/user/login.jsp?code=101");
%>