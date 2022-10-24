<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	
	// 데이터베이스 확인
	int result = 0;
	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "select count(`nick`) from `board_user` where `nick`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, nick);
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			result = rs.getInt(1);
		}
		
		rs.close();
		psmt.close();
		conn.close();		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>
