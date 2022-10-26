<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인 여부에 따라 페이지 분기
	UserBean sessUser = (UserBean)session.getAttribute("sessUser");
	
	if(sessUser == null){
		pageContext.forward("./user/login.jsp");
	}else{
		pageContext.forward("./list.jsp");
	}
%>