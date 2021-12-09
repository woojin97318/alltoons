package com.alltoons.root.member.controller;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName {
	@Autowired
	MemberService ms;

	/*
	 * private MemberDTO dto;
	 * 
	 * public void setDTO(MemberDTO dto) { this.dto = dto; } public MemberDTO
	 * getDTO() { return dto; }
	 */

	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("userChk")
	public String userChk(@RequestParam("userEmail") String userEmail, @RequestParam("userPw") String userPw,
			@RequestParam(required = false) String autoLogin, HttpServletResponse response, HttpSession session,
			Model model) { // 로그인 사용자 확인
		String message = ms.userChk(userEmail, userPw);
		String url = null;
		if (message.equals("로그인 성공")) {
			session.setAttribute(LOGIN, userEmail);
			if (autoLogin != null) {
				int limitTime = 60 * 60 * 24 * 90; // 90일
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
		} else { // 가입된 사용자가 아닐경우 or 비밀번호가 틀릴경우 해당 메시지 출력
			url = "member/login";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@GetMapping("signup")
	public String signup() {
		return "member/signup";
	}

	// 정보 입력 후 회원가입 '가입하기'버튼 클릭시 동작
	@PostMapping("signupform")
	public String signupform(MultipartHttpServletRequest mul, Model model) {
		int result = ms.signUpForm(mul);
		String message, url;
		if (result == 1) {
			message = "Alltoons 회원가입이 완료되었습니다";
			url = "member/login";
		} else {
			message = "다시 시도해주세요";
			url = "member/signup";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@GetMapping("sendmail")
	public void sendMail(HttpServletResponse response) throws Exception {
		String authKey = ms.rand();
		StringBuffer sb = new StringBuffer();// 일반 String 보다 처리속도가 빠르다
		sb.append("<h1>올툰즈 이메일 인증입니다!</h1>");
		sb.append("	<div>하단의 인증번호를 3분안에 입력해주세요!</div>\r\n");

		sb.append("<h2>" + authKey + "</h2>\r\n");
		sb.append("</a>");
		String msg = sb.toString();
		ms.sendMail("tmd0915mp@naver.com", "(Alltoons) 이메일 인증번호입니다.", msg);
		// ms.sendMail("tmd0915mp@naver.com", "(title)text mail ", "(content) Hello");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("메일 전송 완료");

	}

	@GetMapping("auth_form")
	public String authForm() {
		return "auth";
	}

	@GetMapping("auth")
	public String auth(HttpServletRequest request) {
		ms.auth(request);
		return "redirect:https://www.naver.com/";

	}

	@GetMapping("auth_check")
	public String authCheck(@RequestParam String userid, @RequestParam String userkey, HttpSession session) {
		String sessionKey = (String) session.getAttribute(userid);
		if (sessionKey != null) {
			if (sessionKey.equals(userkey)) {
				session.setAttribute("userid", userid);
			}
		}
		return "redirect:auth_form";
	}
}