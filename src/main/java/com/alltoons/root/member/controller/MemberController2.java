package com.alltoons.root.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.member.service.MemberService2;

@Controller
@RequestMapping("member")
public class MemberController2 implements MemberSessionName {
	@Autowired MemberService2 ms2;
	
	@GetMapping("findPassword")
	public String findPassword() {
		return "findPassword";
	}
	@GetMapping("memberDelete")
	public String memberDelete() {
		return "member/memberDelete";
	}
	@PostMapping("memberDeleteChk")
	public String memberDeleteChk(@RequestParam String userPw,
			Model model, HttpSession session) {
		String message = ms2.memberDeleteChk(userPw, session.getAttribute(LOGIN).toString());
		String url = null;
		if(message.equals("탈퇴가 완료되었습니다")) {
			url = "index";
		}else {
			url = "member/memberDelete";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}
	@GetMapping("myPage")
	public String myPage(HttpSession session, Model model) {
		
		return "member/myPage";
	}
}
