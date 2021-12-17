package com.alltoons.root.member.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.review.dto.MyReviewDTO;

public interface MemberMapper2 {
	public void memberDelete(String userEmail);
	public void PasswordModify(
			@Param("pw") String newUserPw, @Param("email")String userEmail);
	public int userImageModify(
			@Param("email") String userEmail, @Param("image")String userImage);
	public int getFavorites(String userEmail);
	public int getInterest(String userEmail);
	public int myReviewCnt(String userEmail);
	public ArrayList<MyReviewDTO> getMyReview(String userEmail);
	public int myReviewDelete(int reviewNum);
	public int userImageDefault(String userEmail);
}
