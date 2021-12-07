package com.alltoons.root.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alltoons.root.member.service.MemberService2;

@Controller
@RequestMapping("member")
public class MemberController2 {
	@Autowired MemberService2 ms2;
	
	@GetMapping("findPassword")
	public String findPassword() {
		return "findPassword";
	}
}
