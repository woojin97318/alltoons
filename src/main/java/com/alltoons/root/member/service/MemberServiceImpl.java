package com.alltoons.root.member.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberMapper mapper;
	BCryptPasswordEncoder encoder;
	
	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}

	@Override
	public boolean loginChk(String userEmail, String userPw) {
		boolean result = false;
		MemberDTO dto = mapper.loginChk(userEmail);
		if(userEmail.equals(dto.getUserEmail()) &&
				encoder.matches(userPw, dto.getUserPassword())) {
			result = true;
		}
		return result;
	}

	@Override
	public void keepLogin(String sessionId, Date limitDate, String userEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("userEmail", userEmail);
		mapper.keepLogin(map);
	}
}
