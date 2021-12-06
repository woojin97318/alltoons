package com.alltoons.root.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alltoons.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	MemberService ms;

	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("userChk")
	public String userChk() {
		return "";
	}

	@GetMapping("signup")
	public String signUp() {
		return "member/signup";
	}
	
	//signup.jsp의 가입하기 버튼 클릭시 동작(회원가입처리)
	@PostMapping("signupform")
	public String signUpForm() {
		return "member/signupform";
	}
}
