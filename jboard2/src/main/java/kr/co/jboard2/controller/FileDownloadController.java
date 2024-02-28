package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.FileDTO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;

@WebServlet("/fileDownload.do")
public class FileDownloadController extends HttpServlet {
	private static final long serialVersionUID = 3454011666393788527L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private FileService service = FileService.getInstance();
	private ArticleService articleService = ArticleService.getInstance();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파일번호 수신
		String fno = req.getParameter("fno");
		
		// 파일 조회
		FileDTO fileDTO = service.selectFile(fno);
		
		// 파일 다운로드
		articleService.fileDownload(req, resp, fileDTO);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}





