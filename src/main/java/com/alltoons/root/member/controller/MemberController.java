package com.alltoons.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName {
	@Autowired MemberService ms;

	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("loginChk")
	public String userChk(@RequestParam("userEmail") String userEmail,
			@RequestParam("userPw") String userPw,
			@RequestParam(required = false) String autoLogin,
			HttpServletResponse response, HttpSession session,
			Model model) {
		String message = ms.loginChk(userEmail, userPw);
		String url = null;
		if(message.equals("로그인 성공")) {
			session.setAttribute(LOGIN, userEmail);
			if(autoLogin != null) {
				int limitTime = 60*60*24*90; //90일
				Cookie logincookie = new Cookie("loginCookie", session.getId());
				logincookie.setPath("/");
				logincookie.setMaxAge(limitTime);
				response.addCookie(logincookie);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(new Date());
				cal.add(Calendar.MONTH, 3);
				
				java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
				ms.keepLogin(session.getId(), limitDate, userEmail);
			}
			url = "index";
		}else { //가입된 사용자가 아닐경우 or 비밀번호가 틀릴경우 해당 메시지 출력
			url = "member/login";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@GetMapping("signup")
	public String signUp() {
		return "member/signup";
	}

	// signup.jsp의 가입하기 버튼 클릭시 동작(회원가입처리)
	@PostMapping("signupform")
	public String signUpForm() {
		return "member/signupform";
	}
}