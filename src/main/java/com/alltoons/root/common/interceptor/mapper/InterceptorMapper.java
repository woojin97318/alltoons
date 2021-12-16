package com.alltoons.root.common.interceptor.mapper;

import com.alltoons.root.member.dto.MemberDTO;

public interface InterceptorMapper {
	public MemberDTO getUserSessionId(String sessionId);
	public MemberDTO getDivision(String userEmail);
}
