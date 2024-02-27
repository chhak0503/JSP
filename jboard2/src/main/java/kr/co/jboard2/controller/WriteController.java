package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.service.ArticleService;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = -1583953554011146813L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.getInstance();

	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		/*
		// Multipart/form-data는 getParameter 수신 안됨
		String title   = req.getParameter("title");
		String content = req.getParameter("content");
		String writer  = req.getParameter("writer");
		*/
		String regip   = req.getRemoteAddr();
		
		ArticleDTO articleDTO = service.fileUpload(req);
		articleDTO.setRegip(regip);
		
		logger.debug(""+articleDTO);
		
		service.insertArticle(articleDTO);
		
		resp.sendRedirect("/jboard2/list.do");
	}
}


