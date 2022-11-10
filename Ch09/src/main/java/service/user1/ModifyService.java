package service.user1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModifyService {
	private static ModifyService instance = new ModifyService();
	public static ModifyService getInstance() {
		return instance;
	}
	
	private ModifyService() {}
	
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/user1/modify.jsp";
	}
}
