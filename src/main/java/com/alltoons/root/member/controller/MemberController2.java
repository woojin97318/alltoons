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
	public String myPage() {
		return "member/myPage";
	}
	@GetMapping("pwModify")
	public String pwModify() { //비밀번호 변경전 현재 비밀번호 확인 페이지
		return "member/pwModify";
	}
	@PostMapping("pwModifyChk")
	public String pwModifyChk(@RequestParam String userPw,
			HttpSession session, Model model) {
		String message = ms2.pwModifyChk(userPw, session.getAttribute(LOGIN).toString());
		String url = null;
		if(message.equals("비밀번호확인")) {
			return "redirect:newPassword";
		}else {
			url = "member/pwModify";
			model.addAttribute("message", message);
			model.addAttribute("url", url);
			return "/common/alertHref";
		}
	}
	@GetMapping("newPassword")
	public String newPassword() {
		return "member/newPassword";
	}
	@PostMapping("newPasswordChk")
	public String newPasswordChk(Model model, HttpSession session,
			@RequestParam String newUserPw, @RequestParam String newUserPwChk) {
		String message = null;
		String url = null;
		if(newUserPw.equals("") || newUserPwChk.equals("")) {
			message = "비밀번호를 입력해주세요";
			url = "member/newPassword";
			model.addAttribute("message", message);
			model.addAttribute("url", url);
			return "/common/alertHref";
		}else if(newUserPw.equals(newUserPwChk)) {
			ms2.PasswordModify(newUserPw, session.getAttribute(LOGIN).toString());
			message = "비밀번호가 변경되었습니다";
			url = "member/myPage";
			model.addAttribute("message", message);
			model.addAttribute("url", url);
			return "/common/alertHref";
		}else {
			message = "비밀번호가 일치하지 않습니다";
			url = "member/newPassword";
			model.addAttribute("message", message);
			model.addAttribute("url", url);
			return "/common/alertHref";
		}
	}
}
