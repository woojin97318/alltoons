package com.alltoons.root.member.service;

import java.sql.Date;

import com.alltoons.root.member.dto.MemberDTO;

public interface MemberService {
	public String userChk(String userEmail, String userPw);
	public void keepLogin(String sessionId, Date limitDate, String userEmail);
	public int signUpForm(MemberDTO dto);
}
