package com.alltoons.root.member.service;

import java.sql.Date;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MemberService {
	public static final String MEMBER_IMAGE_REPO = "C:/alltoonsImage/member";
	public static final String WEBTOON_IMAGE_REPO = "C:/alltoonsImage/webtoon";

	public int signUpForm(MultipartHttpServletRequest mul);

	public String userChk(String userEmail, String userPw, Model model);
	public void keepLogin(String sessionId, Date limitDate, String userEmail);

	public void getUserInfo(Model model, String userEmail);
	public void getFavoritesInterest(Model model, String userEmail);
	public int userImageModify(MultipartHttpServletRequest mul);
	public int userImageDefault(String userEmail);

	public String pwModifyChk(String userPw, String userEmail);
	public void PasswordModify(String newUserPw, String userEmail);
	public String memberDeleteChk(String userPw, String userEmail);

	public void myReviewCnt(Model model, String userEmail);
	public void myReviewContent(Model model, String userEmail);
	public int myReviewDelete(int reviewNum);

	public String newPassword(String email);

	public String rand();
	public void sendMail(String to, String subject, String body);
	public int emailChk(String email);
}
