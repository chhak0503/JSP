<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String uid     = request.getParameter("uid");
	String regip   = request.getRemoteAddr();
	
	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setString(3, uid);
		psmt.setString(4, regip);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/JBoard1/list.jsp");
%>