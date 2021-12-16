package com.alltoons.root.common.interceptor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alltoons.root.common.interceptor.mapper.InterceptorMapper;
import com.alltoons.root.member.dto.MemberDTO;

@Service
public class InterceptorServiceImpl implements InterceptorService {
	@Autowired InterceptorMapper mapper;
	
	@Override
	public MemberDTO getUserSessionId(String sessionId) {
		return mapper.getUserSessionId(sessionId);
	}

	@Override
	public String getDivision(String userEmail) {
		MemberDTO dto = mapper.getDivision(userEmail);
		return dto.getDivision();
	}
}
