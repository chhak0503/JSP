<%@page import="ch07.dto.FileDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
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
	
	// FileDTO 객체 생성
	FileDTO fileDTO = new FileDTO();
	
	try{
		// 파일 업로드 스트림 작업
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> iter = items.iterator();
		
		while(iter.hasNext()){
			
			FileItem item = iter.next();
			
			if(!item.isFormField()){
				// 파일 업로드 처리
				
				// 확장자 추출
				String fileName = item.getName();
				int idx = fileName.lastIndexOf(".");
				String ext = fileName.substring(idx);
				
				// 중복될 수 없는 파일명 생성
				String savedFileName = UUID.randomUUID().toString()+ext;
				fileDTO.setoName(fileName);
				fileDTO.setsName(savedFileName);
				
				// 파일 쓰기
				File uploadedFile = new File(uploadsPath + "/" + savedFileName);
				item.write(uploadedFile);
				System.out.println("File upload!");
			}else{
				// 일반 데이터 처리
				String fieldName = item.getFieldName();
				String value = item.getString("UTF-8"); 
				System.out.println(fieldName + " : " + value);
				
				if(fieldName.equals("title")){
					fileDTO.setTitle(value);
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 데이터베이스 저장
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
	
		PreparedStatement psmt = conn.prepareStatement("INSERT INTO `FileTest` (`title`, `oName`, `sName`, `rdate`) VALUES (?,?,?,NOW())");
		psmt.setString(1, fileDTO.getTitle());
		psmt.setString(2, fileDTO.getoName());
		psmt.setString(3, fileDTO.getsName());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("../2.fileDownloadTest.jsp");
%>








