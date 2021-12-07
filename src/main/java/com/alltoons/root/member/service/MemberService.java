package com.alltoons.root.member.service;

import java.sql.Date;

public interface MemberService {
	public String loginChk(String userEmail, String userPw);
	public void keepLogin(String sessionId, Date limitDate, String userEmail);
}
