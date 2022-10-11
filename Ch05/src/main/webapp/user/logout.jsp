<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션 삭제
	session.invalidate();

	// 자동 로그인 관련 쿠키 삭제
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("cid")){
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
	}

	response.sendRedirect("./login.jsp");
%>