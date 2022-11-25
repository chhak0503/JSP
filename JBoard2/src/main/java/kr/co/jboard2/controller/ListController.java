package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.vo.ArticleVO;

@WebServlet("/list.do")
public class ListController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("pg");

		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
				
		// 전체 게시물 갯수 
		int total = service.selectCountTotal();
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 글 가져오기
		List<ArticleVO> articles = service.selectArticles(start);
		
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum);		
		req.setAttribute("currentPage", currentPage);		
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
