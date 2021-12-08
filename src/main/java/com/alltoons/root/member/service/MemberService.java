package com.alltoons.root.member.service;

import java.sql.Date;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MemberService {
	public static final String IMAGE_REPO = "C:/alltoonsImage/member";
	public String userChk(String userEmail, String userPw);
	public void keepLogin(String sessionId, Date limitDate, String userEmail);
	public int signUpForm(MultipartHttpServletRequest mul);
}
