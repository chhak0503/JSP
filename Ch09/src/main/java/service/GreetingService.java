package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreetingService {

	private static GreetingService instance = new GreetingService();
	public static GreetingService getInstance() {
		return instance;
	}
	
	private GreetingService() {}
	
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/greeting.jsp";
	}
	
	
	
}
