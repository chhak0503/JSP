package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeService {

	private static WelcomeService instance = new WelcomeService();
	public static WelcomeService getInstance() {
		return instance;
	}
	
	private WelcomeService() {}
	
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/welcome.jsp";
	}
	
	
	
}
