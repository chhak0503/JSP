package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.CookieNotFoundException;

import kr.co.jboard2.dao.UserDAO;

@WebServlet("/user/logout.do")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		
		// 세션 제거
		HttpSession session = req.getSession();
		session.removeAttribute("sessUser");
		session.invalidate();
		
		// 쿠키 제거 <- 김지홍씨 감사합니다.
		Cookie cookie = new Cookie("SESSID", null);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		resp.addCookie(cookie);
		
		// 데이터베이스 세션 로그아웃
		UserDAO.getInstance().updateUserForSessionOut(uid);
		
		resp.sendRedirect("/JBoard2/user/login.do?success=201");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}

