package com.alltoons.root.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.member.mail.service.MailService;
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

	@GetMapping("signup")
	public String signup() {
		return "member/signup";
	}

	@PostMapping("signupform") // 회원정보 입력 후 '가입하기'버튼 클릭시 동작
	public String signupform(MultipartHttpServletRequest mul, Model model) {
		int result = ms.signUpForm(mul);
		String message, url;
		if (result == 1) {
			message = "Alltoons 회원가입이 완료되었습니다";
			url = "member/login";
		} else {
			message = "회원가입 Error / 문의 바랍니다";
			url = "member/signup";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@ResponseBody
	@GetMapping(value = "sendmail", produces = "application/json; charset=utf-8")
	public boolean sendMailAuth(HttpSession session, @RequestParam String email) {
		int ran = new Random().nextInt(100000) + 10000; // 10000~99999
		String joinCode = String.valueOf(ran);
		session.setAttribute("joinCode", joinCode);
		String subject = "올툰즈 회원가입 인증 코드 발급 안내 입니다!";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");

		setAuthKey(joinCode);

		return mailService.send(subject, sb.toString(), "alltoons2021@gmail.com", email, null);
	}

	@ResponseBody
	@GetMapping(value = "chkKey", produces = "application/json; charset=utf-8")
	public boolean chkKey(@RequestParam String key) {
		String sysKey = getAuthKey();
		return sysKey.equals(key);
	}

	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("userChk") // 로그인 사용자 확인
	public String userChk(@RequestParam("userEmail") String userEmail, @RequestParam("userPw") String userPw,
			@RequestParam(required = false) String autoLogin, HttpServletResponse response, HttpSession session,
			Model model) {
		String message = ms.userChk(userEmail, userPw, model);
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

	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response,
			@CookieValue(value = "loginCookie", required = false) Cookie loginCookie, Model model) throws Exception {
		if (session.getAttribute(LOGIN) != null) {
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				ms.keepLogin("nan", new java.sql.Date(System.currentTimeMillis()),
						(String) session.getAttribute(LOGIN));
			}
		}
		session.invalidate();
		model.addAttribute("message", "로그아웃 되었습니다");
		model.addAttribute("url", "main");
		return "/common/alertHref";
	}

	@GetMapping("myPage")
	public String myPage(Model model, HttpSession session) {
		ms.getUserInfo(model, session.getAttribute(LOGIN).toString());
		ms.getFavoritesInterest(model, session.getAttribute(LOGIN).toString());
		return "member/myPage";
	}

	@GetMapping("userImageView")
	public void userImageView(@RequestParam("file") String fileName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		File file = new File(MemberService.MEMBER_IMAGE_REPO + "/" + fileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}

	@GetMapping("userImageModify")
	public String userImageModify(Model model, HttpSession session) {
		ms.getUserInfo(model, session.getAttribute(LOGIN).toString());
		return "member/userImageModify";
	}

	@PostMapping("userImageModifyPage")
	public String userImageModifyPage(MultipartHttpServletRequest mul, Model model) { // 이미지 변경후 수정하기 버튼 클릭할 때
		int result = ms.userImageModify(mul);
		String message, url = "member/myPage";
		if (result == 1)
			message = "프로필 사진이 수정되었습니다";
		else
			message = "프로필 사진 수정 Error";
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@GetMapping("userImageDefault")
	public String userImageDefault(@RequestParam String userEmail, Model model) {
		int result = ms.userImageDefault(userEmail);
		String message, url = "member/myPage";
		if (result == 1)
			message = "수정이 완료되었습니다";
		else
			message = "프로필 사진 수정 Error";
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@GetMapping("pwModify") // 비밀번호 변경전 현재 비밀번호 확인 페이지
	public String pwModify() {
		return "member/pwModify";
	}

	@PostMapping("pwModifyChk")
	public String pwModifyChk(@RequestParam String userPw, HttpSession session, Model model) {
		String message = ms.pwModifyChk(userPw, session.getAttribute(LOGIN).toString());
		String url = null;
		if (message.equals("비밀번호확인")) {
			return "redirect:newPassword";
		} else {
			url = "member/pwModify";
			model.addAttribute("message", message);
			model.addAttribute("url", url);
			return "/common/alertHref";
		}
	}

	@GetMapping("newPassword") // 새 비밀번호 입력 페이지
	public String newPassword() {
		return "member/newPassword";
	}

	@PostMapping("newPasswordChk")
	public String newPasswordChk(Model model, HttpSession session, @RequestParam String newUserPw,
			@RequestParam String newUserPwChk) {
		String message = null;
		String url = null;
		if (newUserPw.equals("") || newUserPwChk.equals("")) {
			message = "비밀번호를 입력해주세요";
			url = "member/newPassword";
		} else if (newUserPw.equals(newUserPwChk)) {
			ms.PasswordModify(newUserPw, session.getAttribute(LOGIN).toString());
			message = "비밀번호가 변경되었습니다";
			url = "member/myPage";
		} else {
			message = "비밀번호가 일치하지 않습니다";
			url = "member/newPassword";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@GetMapping("memberDelete") // 회원 탈퇴 전 비밀번호 확인
	public String memberDelete() {
		return "member/memberDelete";
	}

	@PostMapping("memberDeleteChk") // 회원 탈퇴
	public String memberDeleteChk(Model model, @RequestParam String userPw, HttpSession session) {
		String message = ms.memberDeleteChk(userPw, session.getAttribute(LOGIN).toString());
		String url = null;
		if (message.equals("탈퇴가 완료되었습니다"))
			url = "index";
		else
			url = "member/memberDelete";
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}

	@GetMapping("myReview")
	public String myReview(Model model, HttpSession session) {
		ms.myReviewCnt(model, session.getAttribute(LOGIN).toString());
		ms.myReviewContent(model, session.getAttribute(LOGIN).toString());
		return "member/myReview";
	}

	@GetMapping("myReviewDelete")
	public String myReviewDelete(@RequestParam int reviewNum, Model model) {
		int result = ms.myReviewDelete(reviewNum);
		String message;
		if (result == 1) {
			message = "삭제가 완료되었습니다";
		} else {
			message = "삭제 Error";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "member/myReview");
		return "/common/alertHref";
	}

	@GetMapping("webtoonImageView")
	public void webtoonImageView(@RequestParam("file") String fileName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		File file = new File(MemberService.WEBTOON_IMAGE_REPO + "/" + fileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}

	@GetMapping("findpassword")
	public String findPassword() {
		return "member/findPassword";
	}

	@ResponseBody
	@GetMapping(value = "findpwdmail", produces = "application/json; charset=utf-8")
	public boolean sendMailPassword(HttpSession session, @RequestParam String email) {
		String password = ms.newPassword(email);
		session.setAttribute("joinCode", password);
		String subject = email + "님의 비밀번호입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append(email + "님의 임시 비밀번호는 " + password + " 입니다.");
		sb.append("반드시 비밀번호를 변경해주세요!");
		return mailService.send(subject, sb.toString(), "alltoons2021@gmail.com", email, null);
	}

	@ResponseBody
	@GetMapping(value = "userfindchk", produces = "application/json; charset=utf-8")
	public boolean sendMailPassword(@RequestParam String email) {
		int result = ms.userFindChk(email);
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}

}