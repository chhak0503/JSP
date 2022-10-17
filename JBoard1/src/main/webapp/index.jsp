<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인 여부에 따라 페이지 분기
	if(true){
		pageContext.forward("./user/login.jsp");
	}else{
		pageContext.forward("./list.jsp");
	}

%>