package com.alltoons.root.member.mapper;

import java.util.Map;

import com.alltoons.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO loginChk(String userEmail);
	public void keepLogin(Map<String, Object> map);
}
