package kr.co.jboard2.controller.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.jboard2.service.UserService;

@WebServlet("/user/checkUser.do")
public class CheckUserController extends HttpServlet {

	private static final long serialVersionUID = -4527020601023956569L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.getInstance();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type  = req.getParameter("type");
		String value = req.getParameter("value");		
		logger.debug("type : " + type);
		logger.debug("value : " + value);
		
		int result = service.selectCountUser(type, value);
		logger.debug("result : " + result);
		
		// type이 이메일 이면
		HttpSession session = req.getSession();
		
		if(type.equals("email") && result == 0) {
			service.sendEmailCode(session, value);
		}
		
		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		// JSON 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 이메일 전송 코드 일치여부 확인
		 */
		
		// AJAX POST 데이터 스트림 수신처리
		BufferedReader reader = req.getReader();
		StringBuilder requestBody = new StringBuilder();
		String line;
		while((line = reader.readLine()) != null){
			requestBody.append(line);
		}
		reader.close();
		
		// JSON 파싱
		Gson gson = new Gson();
		Properties props = gson.fromJson(requestBody.toString(), Properties.class);
		logger.debug("props : " + props);
	
		// 인증코드 일치여부 확인
		HttpSession session = req.getSession();
		String code = props.getProperty("code");
		int result = service.confirmEmailCode(session, code);
		
		// JSON 생성
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		// JSON 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json);
	}
	
}















