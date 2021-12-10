package com.alltoons.root.mail.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alltoons.root.mail.service.MailService;
//import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MailController {
	@Autowired
	MailService mailService;
	@Autowired
	MemberService memberService;

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	@PostMapping(value = "sendMail/auth", produces = "application/json; charset=utf-8")
	@RequestMapping(value = "/sendMail/auth", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public boolean sendMailAuth(HttpSession session, @RequestParam String email) {
		int ran = new Random().nextInt(100000) + 10000; // 10000~99999
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);

		String subject = "올툰즈 회원가입 인증 코드 발급 안내 입니다!";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
		return mailService.send(subject, sb.toString(), "tmd0915mp@naver.com", email, null);
	}

	// 비밀번호 찾기
	/*
	 * @RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
	 * public String sendMailPassword(HttpSession session, @RequestParam String
	 * id, @RequestParam String email,
	 * 
	 * @RequestParam String captcha, RedirectAttributes ra) { String captchaValue =
	 * (String) session.getAttribute("captcha"); if (captchaValue == null ||
	 * !captchaValue.equals(captcha)) { ra.addFlashAttribute("resultMsg",
	 * "자동 방지 코드가 일치하지 않습니다."); return "redirect:/find/password"; }
	 * 
	 * String user= memberService.findAccount(email); if (user != null) { if
	 * (!user.getId().equals(id)) { ra.addFlashAttribute("resultMsg",
	 * "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다."); return "redirect:/find/password"; }
	 * int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999 String
	 * password = String.valueOf(ran); userService.updateInfo(user.getNo(),
	 * "password", password); // 해당 유저의 DB정보 변경
	 * 
	 * String subject = "임시 비밀번호 발급 안내 입니다."; StringBuilder sb = new
	 * StringBuilder(); sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
	 * mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
	 * ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다."); }
	 * else { ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다."); }
	 * return "redirect:/find/password"; }
	 */
}
