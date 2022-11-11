package controller.user1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User1Dao;
import vo.User1Vo;

@WebServlet("/user1/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		User1Vo vo = User1Dao.getInstance().selectUser(uid);
		
		req.setAttribute("vo", vo);
		
		// 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user1/modify.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid  = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp   = req.getParameter("hp");
		String age  = req.getParameter("age");
		
		User1Vo vo = new User1Vo();
		vo.setUid(uid);
		vo.setName(name);
		vo.setHp(hp);
		vo.setAge(age);
		
		User1Dao.getInstance().updateUser(vo);
		
		// 리다이렉트
		resp.sendRedirect("/Ch09/user1/list.do");
	}
}
