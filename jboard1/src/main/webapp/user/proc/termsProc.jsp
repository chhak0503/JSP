<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String chk1 = request.getParameter("chk1");
	String chk2 = request.getParameter("chk2");

	// 데이터베이스 처리
	
	
	// 세션처리
	try {
		if(chk1.equals("on") && chk2.equals("on")){
			session.setAttribute("agree", true);
			response.sendRedirect("/jboard1/user/register.jsp");
		}else{
			response.sendRedirect("/jboard1/user/terms.jsp?code=300");
		}
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("/jboard1/user/terms.jsp?code=300");
	}
%>