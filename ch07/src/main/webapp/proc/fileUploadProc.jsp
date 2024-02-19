<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파일업로드 디렉터리 경로 설정
	String uploadsPath = application.getRealPath("/uploads");
	
	// 파일 업로드 처리 객체 생성
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	// 인코딩 설정
	upload.setHeaderEncoding("UTF-8");
	
	// 최대 파일크기 설정
	upload.setSizeMax(1024 * 1024 * 10); // 10MB
	
	// 파일 업로드 스트림 작업
	
	
	
	
	
	
	response.sendRedirect("../1.fileUploadTest.jsp");
	
%>