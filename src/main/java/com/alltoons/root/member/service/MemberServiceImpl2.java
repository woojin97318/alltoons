package com.alltoons.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alltoons.root.member.mapper.MemberMapper2;

@Service
public class MemberServiceImpl2 implements MemberService2 {
	@Autowired MemberMapper2 mapper2;
	
	
}
