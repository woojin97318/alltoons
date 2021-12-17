package com.alltoons.root.common.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.common.interceptor.service.InterceptorService;
import com.alltoons.root.member.dto.MemberDTO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter implements MemberSessionName {
	@Autowired InterceptorService is;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie != null) {
			MemberDTO dto = is.getUserSessionId(loginCookie.getValue());
			if(dto != null)
				request.getSession().setAttribute(LOGIN, dto.getUserEmail());
		}
		return true;
	}
}
