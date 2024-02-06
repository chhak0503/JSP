<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");

	if( sessUser == null ){
		// forward는 시스템내에서 자원 이동이기 때문에 서버경로 대신 상대경로 지정
		pageContext.forward("./user/login.jsp");
	}else{
		pageContext.forward("./list.jsp");
	}
%>