package com.alltoons.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.mapper.MemberMapper2;

@Service
public class MemberServiceImpl2 implements MemberService2 {
	@Autowired MemberMapper2 mapper2;
	BCryptPasswordEncoder encoder;

	public MemberServiceImpl2() {
		encoder = new BCryptPasswordEncoder();
	}

	@Override
	public String pwChk(String userPw, String sessionId) {
		MemberDTO dto = maper.
		
		return null;
	}
	
	
}
