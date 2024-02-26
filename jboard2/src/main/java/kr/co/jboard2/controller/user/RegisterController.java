package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.UserDTO;
import kr.co.jboard2.service.UserService;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 7627243987787763399L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 데이터 수신
		String uid   = req.getParameter("uid");
		String pass1 = req.getParameter("pass1");
		String name  = req.getParameter("name");
		String nick  = req.getParameter("nick");
		String email = req.getParameter("email");
		String hp    = req.getParameter("hp");
		String sms   = req.getParameter("sms");
		String regip = req.getRemoteAddr();
		
		// UserDTO 생성
		UserDTO userDTO = new UserDTO();
		userDTO.setUid(uid);
		userDTO.setPass(pass1);
		userDTO.setName(name);
		userDTO.setNick(nick);
		userDTO.setEmail(email);
		userDTO.setHp(hp);
		userDTO.setRegip(regip);
		userDTO.setSms(sms);
		
		// 로그 출력
		logger.debug(userDTO.toString());
		
		// 데이터 INSERT
		service.insertUser(userDTO);
		
		// 리다이렉트
		resp.sendRedirect("/jboard2/user/login.do");
	}
}








