package com.tripon.view.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


// 로그인처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	
	// ▶ preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("-------- 인터셉터 처음 --------");

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userId");
		
		
		// 세션 없으면, 로그인페이지로 이동
		if(obj==null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		// 세션 있으면, 컨트롤러 타게함.
		return true;
	}
	
	
	
	// ▶ postHandle() : 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
		System.out.println("--------- 인터셉터 끝 ---------");
		
		// Cache 방지 
//		if("HTTP/1.1".equals(request.getProtocol())) {
//			response.setHeader ("Cache-Control", "no-cache, no-store, must-revalidate");
//		} else {
//			response.setHeader ("Pragma", "no-cache");
//		}
//		response.setDateHeader ("Expires", 0);

	}

	
	
	
	
	
}
