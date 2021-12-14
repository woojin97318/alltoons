package com.alltoons.root.member.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alltoons.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO userChk(String userEmail);

	public void keepLogin(Map<String, Object> map);

	public int signUpForm(MemberDTO dto);

	public MemberDTO emailChk(String email);
	
	//public int updatePassword(MemberDTO dto);
	public int updatePassword(@Param("codedStr")String codedStr, @Param("email") String email);
}
