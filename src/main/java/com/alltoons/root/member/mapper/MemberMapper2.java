package com.alltoons.root.member.mapper;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper2 {
	public void memberDelete(String userEmail);
	public void PasswordModify(
			@Param("pw") String newUserPw, @Param("email")String userEmail);
	public int userImageModify(
			@Param("email") String userEmail, @Param("image")String userImage);
}
