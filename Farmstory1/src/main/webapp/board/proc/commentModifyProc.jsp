<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String content = request.getParameter("content");
	
	int result = ArticleDAO.getInstance().updateComment(no, content);
	
	// json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	json.addProperty("no", no);
	json.addProperty("content", content);
	
	out.print(json.toString());
%>