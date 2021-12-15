package com.alltoons.root.member.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MemberService2 {
	public static final String MEMBER_IMAGE_REPO = "C:/alltoonsImage/member";
	public static final String WEBTOON_IMAGE_REPO = "C:/alltoonsImage/webtoon";
	public String memberDeleteChk(String userPw, String userEmail);
	public String pwModifyChk(String userPw, String userEmail);
	public void PasswordModify(String newUserPw, String userEmail);
	public void getUserInfo(Model model, String userEmail);
	public int userImageModify(MultipartHttpServletRequest mul);
	public void getFavoritesInterest(Model model, String userEmail);
	public void myReviewCnt(Model model, String userEmail);
	public void myReviewContent(Model model, String userEmail);
	public int myReviewDelete(int reviewNum);
	public int userImageDefault(String userEmail);
}
