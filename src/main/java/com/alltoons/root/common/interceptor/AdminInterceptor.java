package com.alltoons.root.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alltoons.root.common.MemberSessionName;

public class AdminInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if( !(session.getAttribute(LOGIN).equals("alltoons2021@gmail.com")) ) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('관리자만 접근이 가능합니다');" +
					"location.href='" + request.getContextPath() +
					"/main';</script>");
			return false;
		}
		return true;
	}
}
