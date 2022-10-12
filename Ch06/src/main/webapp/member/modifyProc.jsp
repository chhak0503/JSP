<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String pos  = request.getParameter("pos");
	String dep  = request.getParameter("dep");
		
	// 데이터베이스 작업
	try{
		String host = "jdbc:mysql://127.0.0.1:3306/java1db";
		String user = "root";
		String pass = "1234";
		
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql  = "UPDATE `Member` SET ";
		       sql += "`name`='"+name+"',";
		       sql += "`hp`='"+hp+"',";
		       sql += "`pos`='"+pos+"',";
		       sql += "`dep`="+dep+" ";
		       sql += "WHERE `uid`='"+uid+"'";
		       
		stmt.executeUpdate(sql);		       	
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록이동
	response.sendRedirect("./list.jsp");
	
%>