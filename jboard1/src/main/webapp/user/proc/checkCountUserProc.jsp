<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String type  = request.getParameter("type");
	String value = request.getParameter("value");
	
	//System.out.println("uid : " + uid);
	UserDAO dao = UserDAO.getInstance();
	int result = dao.selectCountUser(type, value);	
	
	/*
	if(uid != null){
		result = dao.selectCountUser("uid", uid);		
	}else if(nick != null){
		result = dao.selectCountUser("nick", nick);
	}else if(hp != null){
		result = dao.selectCountUser("hp", hp);
	}else if(email != null){
		result = dao.selectCountUser("email", email);
	}
	*/
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	json.addProperty("type", type);
	out.print(json.toString());
%>










