<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String regip = request.getRemoteAddr();
	

	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/jboard");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);
		psmt.setString(1, uid);
		psmt.setString(2, pass1);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, regip);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/jboard1/user/login.jsp");
%>


