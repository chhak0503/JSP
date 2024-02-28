package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;

@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = -3556762594032868092L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService articleService = ArticleService.getInstance();
	private FileService fileService = FileService.getInstance();

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		ArticleDTO articleDTO = articleService.selectArticle(no);
		
		req.setAttribute("articleDTO", articleDTO);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 파일 업로드
		ArticleDTO articleDTO = articleService.fileUpload(req);
		logger.debug(""+articleDTO);
		
		// 글 등록
		articleService.updateArticle(articleDTO);
		
		// 파일 등록
		List<FileDTO> files = articleDTO.getFileDTOs();
		
		for(FileDTO fileDTO : files) {
			fileDTO.setAno(articleDTO.getNo());
			logger.debug(""+fileDTO);
			
			fileService.insertFile(fileDTO);
		}
		
		resp.sendRedirect("/jboard2/view.do?no="+articleDTO.getNo());
		
	
	}
	
}