package com.alltoons.root.member.mapper;

import java.util.ArrayList;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.dto.MyReviewDTO;

public interface MemberMapper {
	public int signUpForm(MemberDTO dto);

	public MemberDTO userChk(String userEmail);
	public void keepLogin(Map<String, Object> map);

	public int getFavorites(String userEmail);
	public int getInterest(String userEmail);

	public int userImageModify(
			@Param("email") String userEmail, @Param("image")String userImage);
	public int userImageDefault(String userEmail);

	public void PasswordModify(
			@Param("pw") String newUserPw, @Param("email")String userEmail);
	public void memberDelete(String userEmail);

	public int myReviewCnt(String userEmail);
	public ArrayList<MyReviewDTO> getMyReview(String userEmail);
	public int myReviewDelete(int reviewNum);

	public int updatePassword(@Param("codedStr")String codedStr, @Param("email") String email);
	public MemberDTO emailChk(String email);
	public MemberDTO userFindChk(String email);
}
