package kr.co.jboard2.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;

public class ArticleService {

	private static ArticleService instance = new ArticleService();
	public static ArticleService getInstance() {
		return instance;
	}
	private ArticleService() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public int insertArticle(ArticleDTO articleDTO) {
		return dao.insertArticle(articleDTO);
	}
	public ArticleDTO selectArticle(int no) {
		return dao.selectArticle(no);
	}
	public List<ArticleDTO> selectArticles() {
		return dao.selectArticles();
	}
	public void updateArticle(ArticleDTO articleDTO) {
		dao.updateArticle(articleDTO);
	}
	public void deleteArticle(int no) {
		dao.deleteArticle(no);
	}
	
	public ArticleDTO fileUpload(HttpServletRequest req) {
		// 파일 업로드 경로 설정
		ServletContext ctx = req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");
		
		// 파일 업로드 처리 객체 새성
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		// 최대 파일 크기 설정
		upload.setSizeMax(1024 * 1024 * 10); // 10MB
		
		// ArticleDTO 생성
		ArticleDTO articleDTO = new ArticleDTO(); 
		
		// 파일 DTO 리스트 생성
		List<FileDTO> fileDTOs = new ArrayList<>();
		
		// 파일 업로드 스트림 처리
		try {
			List<FileItem> items = upload.parseRequest(req);
			
			// 첨부파일 갯수
			int count = 0;
			
			for(FileItem item : items) {
				
				logger.debug("item : " + item);
				
				if(!item.isFormField()) {
					// 첨부 파일일 경우
					if(!item.getName().isEmpty()) {
						count++;
											
						String fname = item.getName();
						int idx = fname.lastIndexOf(".");
						String ext = fname.substring(idx);
						
						String saveName = UUID.randomUUID().toString() + ext;
						
						FileDTO fileDTO = new FileDTO();
						fileDTO.setoName(fname);
						fileDTO.setsName(saveName);
						fileDTOs.add(fileDTO);
						
						File file = new File(uploadPath + File.separator + saveName);
						item.write(file);
					}
				}else {
					// 폼 데이터일 경우
					String fieldName  = item.getFieldName();
					String fieldValue = item.getString("UTF-8");
					
					if(fieldName.equals("title")) {
						articleDTO.setTitle(fieldValue);
					}else if(fieldName.equals("content")) {
						articleDTO.setContent(fieldValue);
					}else if(fieldName.equals("writer")) {
						articleDTO.setWriter(fieldValue);
					}
				}
			}
			articleDTO.setFile(count);
		}catch (Exception e) {
			logger.error("fileUpload : " + e.getMessage());
		}
		
		articleDTO.setFileDTOs(fileDTOs);
		
		return articleDTO;
	}
	
	public void fileDownload() {
		
	}
	
	
	
	
}
