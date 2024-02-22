package controller.user1;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User1DTO;
import service.User1Service;

@WebServlet("/user1/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private User1Service service = User1Service.getInstance();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 사용자 조회하기
		List<User1DTO> users = service.selectUser1s();
		
		// View에서 users 데이터를 참조하기 위해 request Scope 저장
		req.setAttribute("users", users);
		
		// View forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user1/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}






