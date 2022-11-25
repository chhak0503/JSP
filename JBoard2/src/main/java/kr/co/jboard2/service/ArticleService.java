package kr.co.jboard2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.vo.ArticleVO;

public enum ArticleService {
	
	INSTANCE;
	private ArticleDAO dao = ArticleDAO.getInstance();

	public int insertArticle(ArticleVO article) {
		return dao.insertArticle(article);		
	}
	public void insertFile(int parent, String newName, String fname) {
		dao.insertFile(parent, newName, fname);
	}
	public ArticleVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	public void selectArticles() {}
	public void updateArticle() {}
	public void deleteArticle() {}
	
	public MultipartRequest uploadFile(HttpServletRequest req) throws IOException {
		ServletContext ctx = req.getServletContext();
		String savePath = ctx.getRealPath("/file");
		
		int maxSize = 1024 * 1024 * 10; // 최대 파일 업로드 허용량 10MB
		
		return new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	public String renameFile(String uid, String fname, String path) {
		// 파일명 수정
		int idx = fname.lastIndexOf(".");
		String ext = fname.substring(idx);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext; // 20221026111323_chhak0503.txt 
		
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile);
		
		return newName;
	}
	
	
}
















