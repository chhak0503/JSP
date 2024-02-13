<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no      = request.getParameter("no");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String file    = request.getParameter("file");
	
	ArticleDTO article = new ArticleDTO();
	article.setNo(no);
	article.setTitle(title);
	article.setContent(content);
	
	ArticleDAO dao = ArticleDAO.getInstance();
	dao.updateArticle(article);
			
	response.sendRedirect("/jboard1/view.jsp?no="+no);
%>