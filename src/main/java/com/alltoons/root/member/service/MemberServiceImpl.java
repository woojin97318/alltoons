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
	@Autowired
	MemberMapper mapper;
	BCryptPasswordEncoder encoder;

	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}

	@Override
	public String userChk(String userEmail, String userPw) {
		MemberDTO dto = mapper.userChk(userEmail);
		if (dto == null) {
			return "가입된 사용자가 아닙니다"; // 이메일 없음
		} else if (userEmail.equals(dto.getUserEmail()) && encoder.matches(userPw, dto.getUserPassword())) {
			return "로그인 성공"; // 로그인 성공
		} else {
			return "비밀번호가 틀립니다"; // 비밀번호 틀림
		}
	}

	@Override
	public void keepLogin(String sessionId, Date limitDate, String userEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("userEmail", userEmail);
		mapper.keepLogin(map);
	}

	@Override
	public int signUpForm(MemberDTO dto) {
		System.out.println(dto.getUserEmail());
		System.out.println(dto.getUserPassword());
		System.out.println("변경 전" + dto.getUserPassword());
		String securePw = encoder.encode(dto.getUserPassword());
		System.out.println(securePw);
		dto.setUserPassword(securePw);
		int result = 0;
		try {
			result = mapper.signUpForm(dto);
			System.out.println("회원가입 성공");
		} catch (Exception e) {
			System.out.println("회원가입 실패");

			e.printStackTrace();
		}
		return result;
	}

}
