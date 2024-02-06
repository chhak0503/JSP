<%@page import="kr.co.jboard1.dto.UserDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserDTO user = null;
	
	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/jboard");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_USER_FOR_LOGIN);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			user = new UserDTO();
			user.setUid(rs.getString(1));
			user.setPass(rs.getString(2));
			user.setName(rs.getString(3));
			user.setNick(rs.getString(4));
			user.setEmail(rs.getString(5));
			user.setHp(rs.getString(6));
			user.setRole(rs.getString(7));
			user.setZip(rs.getString(8));
			user.setAddr1(rs.getString(9));
			user.setAddr2(rs.getString(10));
			user.setRegip(rs.getString(11));
			user.setRdate(rs.getString(12));
			user.setLeaveDate(rs.getString(13));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(user != null){
		// 회원이 맞을 경우
		// 회원객체 세션 저장
		session.setAttribute("sessUser", user);
		
		// 글목록 이동
		response.sendRedirect("/jboard1/list.jsp");
		
	}else{
		// 회원이 아닐 경우 -> 로그인 이동
		response.sendRedirect("/jboard1/user/login.jsp?code=100");
	}
%>





