package service.user1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterService {
	private static RegisterService instance = new RegisterService();
	public static RegisterService getInstance() {
		return instance;
	}
	
	private RegisterService() {}
	
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/user1/register.jsp";
	}
}
