<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// multipart 전송 데이터 수신
	String savePath = application.getRealPath("/file");
	int maxSize = 1024 * 1024 * 10; // 최대 파일 업로드 허용량 10MB
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	String group   = mr.getParameter("group");
	String cate    = mr.getParameter("cate");
	String uid     = mr.getParameter("uid");
	String title   = mr.getParameter("title");
	String content = mr.getParameter("content");	
	String fname   = mr.getFilesystemName("fname");
	String regip   = request.getRemoteAddr();
	
	ArticleBean article = new ArticleBean();
	article.setCate(cate);
	article.setTitle(title);
	article.setContent(content);
	article.setUid(uid);
	article.setFname(fname);
	article.setRegip(regip);
	
	ArticleDAO dao = ArticleDAO.getInstance();
	int parent = dao.insertArticle(article);
	
	// 파일을 첨부했으면 파일처리
	if(fname != null){
		// 파일명 수정
		int idx = fname.lastIndexOf(".");
		String ext = fname.substring(idx);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext; // 20221026111323_chhak0503.txt 
		
		File oriFile = new File(savePath, fname);
		File newFile = new File(savePath, newName);
		
		oriFile.renameTo(newFile);
		
		// 파일 테이블 저장
		dao.insertFile(parent, newName, fname);
	}
	
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>