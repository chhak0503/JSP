package sub3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid  = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		System.out.println("uid : " + uid);
		System.out.println("pass : " + pass);

		// 현재 사용자 세션 
		HttpSession session = req.getSession();
		
		// 사용자가 a101이고 비밀번호가 1234라고 가정
		if(uid.equals("a101") && pass.equals("1234")) {
			// 회원이 맞으면
			session.setAttribute("sessUid", uid);
			resp.sendRedirect("/ch09/3.ListenerTest.jsp?success=200");
			
		}else {
			// 회원이 아니면
			resp.sendRedirect("/ch09/3.ListenerTest.jsp?success=100");
			
		}
	
	}
	
}
