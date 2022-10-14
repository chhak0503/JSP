<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid    = request.getParameter("uid");
	String name   = request.getParameter("name");
	String birth  = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String age    = request.getParameter("age");
	String addr   = request.getParameter("addr");
	String hp     = request.getParameter("hp");

	try{
		Connection conn = DBCP.getConnection("dbcp_java1db");
		
		String sql = "update `user5` set `name`=?, `birth`=?, `gender`=?, `age`=?, `addr`=?, `hp`=? ";
		       sql += "where `uid`=?";
		       
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, birth);
		psmt.setString(3, gender);
		psmt.setString(4, age);
		psmt.setString(5, addr);
		psmt.setString(6, hp);
		psmt.setString(7, uid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>