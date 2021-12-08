package com.alltoons.root.member.service;

public interface MemberService2 {
	public String memberDeleteChk(String userPw, String userEmail);
	public String pwModifyChk(String userPw, String userEmail);
	public void PasswordModify(String newUserPw, String userEmail);
}
