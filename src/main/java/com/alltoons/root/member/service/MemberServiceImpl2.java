package com.alltoons.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.mapper.MemberMapper;
import com.alltoons.root.member.mapper.MemberMapper2;

@Service
public class MemberServiceImpl2 implements MemberService2 {
	@Autowired MemberMapper mapper;
	@Autowired MemberMapper2 mapper2;
	BCryptPasswordEncoder encoder;

	public MemberServiceImpl2() {
		encoder = new BCryptPasswordEncoder();
	}

	@Override
	public String memberDeleteChk(String userPw, String userEmail) {
		MemberDTO dto = mapper.userChk(userEmail);
		if(encoder.matches(userPw, dto.getUserPassword())) {
			mapper2.memberDelete(userEmail);//회원정보 삭제
			return "탈퇴가 완료되었습니다";
		}else {
			return "비밀번호가 틀립니다";
		}
	}
	
	
}
