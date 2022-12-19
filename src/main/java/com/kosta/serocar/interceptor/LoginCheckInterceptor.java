package com.kosta.serocar.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginCheckInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("memberEmail") != null) {
			return true;
		}else {
			String ajax = request.getHeader("x-requested-with");
			if(ajax != null && ajax.equals("XMLHttpReqyuest")) {
				response.sendError(403);
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('로그인 후 이용 가능합니다.'); location.href='"+"/login"+"';</script>"); 
				writer.close();
			}
			
//			System.out.println("**HandlerInterceptor 실행**" + request.getRequestURI() + " 비로그인상태에서 접근불가");
		}
		
		return false;
		
	}

}
