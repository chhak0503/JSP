package kr.co.jboard2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.dto.UserDTO;

@WebFilter(urlPatterns = {"/list.do", "/view.do", "/write.do", "/modify.do"})
public class CheckLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// 로그인 여부 확인
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
		
		if(sessUser != null) {
			// 다음 필터(컨트롤러)로 이동
			chain.doFilter(request, response);
			
		}else {
			// 로그인 페이지로 리다이렉트
			HttpServletResponse resp = (HttpServletResponse) response;
			resp.sendRedirect("/jboard2/user/login.do?success=101");
		}
		
	}

}
