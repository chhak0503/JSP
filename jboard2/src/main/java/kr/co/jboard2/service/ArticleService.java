package kr.co.jboard2.service;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dto.ArticleDTO;

public class ArticleService {

	private static ArticleService instance = new ArticleService();
	public static ArticleService getInstance() {
		return instance;
	}
	private ArticleService() {}
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public void insertArticle(ArticleDTO articleDTO) {
		dao.insertArticle(articleDTO);
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
	
	public void fileUpload(ServletContext ctx) {
		// 파일 업로드 경로 설정
		String uploadPath = ctx.getRealPath("/uploads");
		
		// 파일 업로드 처리 객체 새성
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		// 최대 파일 크기 설정
		upload.setSizeMax(1024 * 1024 * 10); // 10MB
		
		// 파일 업로드 스트림 처리
		
		
		
	}
	
	public void fileDownload() {
		
	}
	
	
	
	
}
