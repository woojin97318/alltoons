package com.alltoons.root.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alltoons.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired MemberService ms;

	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("userChk")
	public String userChk() {
		return "";
	}
	@PostMapping("signUp")
	public String signUp() {
		return "member/signUp";
	}
}
