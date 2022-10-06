<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// id가 abcd이고 pw가 1234라고 가정
	if(pw.equals("1234")){
		// 회원 맞음
		
		// 클라이언 정보 설정
		session.setAttribute("uid", id);
		response.sendRedirect("./loginSuccess.jsp");
		
	}else{
		// 회원 아님
		response.sendRedirect("../6_session.jsp");		
	}
%>