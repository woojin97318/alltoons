package com.alltoons.root.common.interceptor.service;

import com.alltoons.root.member.dto.MemberDTO;

public interface InterceptorService {
	public MemberDTO getUserSessionId(String sessionId);
	public String getDivision(String userEmail);
}
