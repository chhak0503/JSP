<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String pg = request.getParameter("pg");
	String no = request.getParameter("no");
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글삭제 + 댓글삭제
	dao.deleteArticle(no);
	
	// 파일삭제(테이블)
	String fileName = dao.deleteFile(no);
	
	// 파일삭제(디렉토리)
	if(fileName != null){
		
		String path = application.getRealPath("/file");
		
		File file = new File(path, fileName);
		
		if(file.exists()){
			file.delete();
		}
	}

	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate+"&pg="+pg);
%>