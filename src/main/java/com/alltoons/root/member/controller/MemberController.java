package com.alltoons.root.member.controller;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.mail.service.MailService;
import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName {
	@Autowired
	MemberService ms;

	@Autowired
	MailService mailService;

	private String authKey;
	
	public String getAuthKey() {
		return authKey;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}

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
			url = "main";
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
		System.out.println(mul);
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

	
	@GetMapping(value = "sendmail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean sendMailAuth(HttpSession session, @RequestParam String email) {
		System.out.println(email);
		int ran = new Random().nextInt(100000) + 10000; // 10000~99999
		String joinCode = String.valueOf(ran);
		System.out.println("인증키 생성 : " + joinCode);
		session.setAttribute("joinCode", joinCode);
		String subject = "올툰즈 회원가입 인증 코드 발급 안내 입니다!";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");

		setAuthKey(joinCode);

		int result = ms.emailChk(email);

		if (result == 0) {
			System.out.println("메일 중복 확인 : " + email + "결과 확인 : " + result);
			// 인증 메일 전송
		} else {
			System.out.println("메일 중복 확인 : " + email + "결과 확인 : " + result);
			// 중복 메일 있음 메세지
		}

		return mailService.send(subject, sb.toString(), "alltoons2021@gmail.com", email, null);

	}

	@GetMapping(value = "chkKey", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean chkKey(@RequestParam String key) {
		String sysKey = getAuthKey();

		System.out.println("전송된 인증키 : " + sysKey);
		System.out.println("사용자 입력키 : " + key);
		return sysKey.equals(key);
	}

	@GetMapping("findpassword")
	public String findPassword() {
		return "member/findPassword";
	}

	@GetMapping(value = "findpwdmail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public boolean sendMailPassword(HttpSession session, @RequestParam String email) {
		String password = ms.newPassword(email);
		System.out.println(email + "의 비밀번호: " + password);
		session.setAttribute("joinCode", password);
		String subject = email + "님의 비밀번호입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append(email + "님의 임시 비밀번호는 " + password + " 입니다.");
		sb.append("반드시 비밀번호를 변경해주세요!");
		
		return mailService.send(subject, sb.toString(), "alltoons2021@gmail.com", email, null);

	}

}