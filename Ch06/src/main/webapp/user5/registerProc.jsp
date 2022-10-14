<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid    = request.getParameter("uid");
	String name   = request.getParameter("name");
	String birth  = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String age    = request.getParameter("age");
	String addr   = request.getParameter("addr");
	String hp     = request.getParameter("hp");

	// 데이터베이스 작업
	try{
		// 1단계 - JNDI 서비스 객체생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 서비스를 사용하기 위한 기본 이름
		
		// 2단계 - 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("dbcp_java1db"); // 커넥션 풀 가져오기
		Connection conn = ds.getConnection(); // 커넥션 가져오기
		
		// 3단계
		String sql = "INSERT INTO `user5` VALUES (?,?,?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, birth);
		psmt.setString(4, gender);
		psmt.setString(5, age);
		psmt.setString(6, addr);
		psmt.setString(7, hp);
		
		// 4단계
		psmt.executeUpdate();
		// 5단계
		// 6단계
		psmt.close();
		conn.close(); // 반납
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>






