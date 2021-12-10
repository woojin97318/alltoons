package com.alltoons.root.member.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.member.service.MemberService;
import com.alltoons.root.member.service.MemberService2;

@Controller
@RequestMapping("member")
public class MemberController2 implements MemberSessionName {
	@Autowired MemberService2 ms2;
	
	@GetMapping("memberDelete")
	public String memberDelete() { //회원 탈퇴 전 비밀번호 확인
		return "member/memberDelete";
	}
	@PostMapping("memberDeleteChk")
	public String memberDeleteChk(@RequestParam String userPw,
			Model model, HttpSession session) { //회원 탈퇴
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
	public String newPassword() { //새 비밀번호 입력 페이지
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
	
	@GetMapping("myPage")
	public String myPage(Model model, HttpSession session) { //마이페이지
		ms2.getUserInfo(model, session.getAttribute(LOGIN).toString());
		ms2.getFavoritesInterest(model, session.getAttribute(LOGIN).toString());
		return "member/myPage";
	}
	@GetMapping("userImageView")
	public void userImageView(@RequestParam("file") String fileName,
			HttpServletResponse response) throws Exception {
		// Content-disposition : 파일 다운로드하겠다는 의미
		// attachment : 파일을 다운로드하여 브라우저로 표현하겠다
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		File file = new File(MemberService2.MEMBER_IMAGE_REPO + "/" + fileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@GetMapping("userImageModify")
	public String userImageModify(Model model, HttpSession session) {
		ms2.getUserInfo(model, session.getAttribute(LOGIN).toString());
		return "member/userImageModify";
	}
	@PostMapping("userImageModifyPage")
	public String userImageModifyPage(MultipartHttpServletRequest mul,
			Model model) {
		int result = ms2.userImageModify(mul);
		String message, url;
		if(result == 1) {
			message = "프로필 사진이 수정되었습니다";
			url = "member/myPage";
		}else {
			message = "프로필 사진 수정 Error";
			url = "member/userImageModify";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}
	
	@GetMapping("myReview")
	public String myReview(Model model, HttpSession session) {
		ms2.myReviewCnt(model, session.getAttribute(LOGIN).toString());
		ms2.myReviewContent(model, session.getAttribute(LOGIN).toString());
		return "member/myReview";
	}
	@GetMapping("myReviewDelete")
	public String myReviewDelete(@RequestParam String reviewNum, Model model) {
		int result = ms2.myReviewDelete(reviewNum);
		String message;
		if(result == 1) {
			message = "삭제가 완료되었습니다";
		}else {
			message = "삭제 Error";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "member/myReview");
		return "/common/alertHref";
	}
	@GetMapping("webtoonImageView")
	public void webtoonImageView(@RequestParam("file") String fileName,
			HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		File file = new File(MemberService2.WEBTOON_IMAGE_REPO + "/" + fileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
}
