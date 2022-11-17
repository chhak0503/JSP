<%@page import="com.google.gson.Gson"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");

	List<ArticleBean> latests = ArticleDAO.getInstance().selectLatest(cate);

	Gson gson = new Gson();
	String jsonData = gson.toJson(latests);
	
	out.print(jsonData);
%>
