<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String searchType = request.getParameter("searchType");
	String keyword    = request.getParameter("keyword");
	
	ArticleDAO dao = ArticleDAO.getInstance();
	List<ArticleDTO> articles = dao.selectArticlesForSearch(searchType, keyword);
	
	
	
%>