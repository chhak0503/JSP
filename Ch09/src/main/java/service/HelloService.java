package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloService {

	private static HelloService instance = new HelloService();
	public static HelloService getInstance() {
		return instance;
	}
	
	private HelloService() {}
	
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/hello.jsp";
	}
	
	
	
}
