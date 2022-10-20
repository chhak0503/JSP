<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.JDBC"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");

	int result = 0;
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		
		String sql = "INSERT INTO `user2` VALUES (?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		
		result = psmt.executeUpdate();
		psmt.close();
		conn.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//String jsonData = "{\"result\":"+result+"}";
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	
	out.print(jsonData);
%>





