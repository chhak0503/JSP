<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	String no = request.getParameter("no");
	
	
	ArticleDAO.getInstance().deleteArticle(no);

	response.sendRedirect("/JBoard1/list.jsp?pg="+pg);
%>