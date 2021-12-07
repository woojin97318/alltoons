package com.alltoons.root.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.member.service.MemberService2;

@Controller
@RequestMapping("member")
public class MemberController2 {
	@Autowired MemberService2 ms2;
	
	@GetMapping("findPassword")
	public String findPassword() {
		return "findPassword";
	}
	@GetMapping("memberDelete")
	public String memberDelete() {
		return "member/memberDelete";
	}
	@PostMapping("pwChk")
	public String pwChk(@RequestParam String userPw, Model model,
			HttpSession session) {
		String message = ms2.pwChk(userPw, session.getId());
		return "";
	}
}
