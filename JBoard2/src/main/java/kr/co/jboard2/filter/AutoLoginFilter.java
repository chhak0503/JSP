package kr.co.jboard2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.UserVO;

public class AutoLoginFilter implements Filter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		logger.info("AutoLoginFilter...");
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession sess = req.getSession();
		sess.removeAttribute("sessUserForfindId");
		
		// 자동로그인 여부에 따라 로그인 처리
		Cookie[] cookies = req.getCookies();
		
		if(cookies != null) {
			
			for(Cookie cookie : cookies) {
				
				if(cookie.getName().equals("SESSID")) {
					
					String sessId = cookie.getValue();					
					UserVO vo = UserDAO.getInstance().selectUserBySessId(sessId);
					
					if(vo != null) {
						// 로그인 처리
						sess.setAttribute("sessUser", vo);						
					}
				}
			}
		}
		
		// 다음 필터로 이동 
		chain.doFilter(request, response);
	}
}
