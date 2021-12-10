package com.alltoons.root.member.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.mapper.MemberMapper;
import com.alltoons.root.member.mapper.MemberMapper2;
import com.alltoons.root.review.dto.MyReviewDTO;

@Service
public class MemberServiceImpl2 implements MemberService2 {
	@Autowired MemberMapper mapper;
	@Autowired MemberMapper2 mapper2;
	BCryptPasswordEncoder encoder;

	public MemberServiceImpl2() {
		encoder = new BCryptPasswordEncoder();
	}

	@Override
	public String memberDeleteChk(String userPw, String userEmail) {
		MemberDTO dto = mapper.userChk(userEmail);
		if(encoder.matches(userPw, dto.getUserPassword())) {
			mapper2.memberDelete(userEmail);//회원정보 삭제
			return "탈퇴가 완료되었습니다";
		}else {
			return "비밀번호가 일치하지 않습니다";
		}
	}

	@Override
	public String pwModifyChk(String userPw, String userEmail) {
		MemberDTO dto = mapper.userChk(userEmail);
		if(encoder.matches(userPw, dto.getUserPassword())) {
			return "비밀번호확인";
		}else {
			return "비밀번호가 일치하지 않습니다";
		}
	}

	@Override
	public void PasswordModify(String newUserPw, String userEmail) {
		newUserPw = encoder.encode(newUserPw);
		mapper2.PasswordModify(newUserPw, userEmail);
	}

	@Override
	public void getUserInfo(Model model, String userEmail) {
		model.addAttribute("userInfo", mapper.userChk(userEmail));
	}

	@Override
	public int userImageModify(MultipartHttpServletRequest mul) {
		int result = 0;
		
		MemberDTO dto = new MemberDTO();
		dto.setUserEmail(mul.getParameter("userEmail"));
		
		MultipartFile file = mul.getFile("file");
		if (file.getSize() != 0) { // 사용자 이미지가 들어왔다면
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calendar = Calendar.getInstance();
			String sysFileName = format.format(calendar.getTime());

			sysFileName += file.getOriginalFilename();

			dto.setUserImage(sysFileName);

			File saveFile = new File(MEMBER_IMAGE_REPO + "/" + sysFileName);
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			dto.setUserImage("default_image.png");
		}
		
		try {
			result = mapper2.userImageModify(dto.getUserEmail(), dto.getUserImage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("mapper2.userImageModify 에러");
		}
		return result;
	}

	@Override
	public void getFavoritesInterest(Model model, String userEmail) {
		int favorites = mapper2.getFavorites(userEmail);
		int interest = mapper2.getInterest(userEmail);
		model.addAttribute("favorites", favorites);
		model.addAttribute("interest", interest);
	}

	@Override
	public void myReviewCnt(Model model, String userEmail) {
		int myReviewCnt = mapper2.myReviewCnt(userEmail);
		model.addAttribute("myReviewCnt", myReviewCnt);
	}

	@Override
	public void myReviewContent(Model model, String userEmail) {
		ArrayList<MyReviewDTO> list = mapper2.getMyReview(userEmail);
		model.addAttribute("myReview", list);
	}

	@Override
	public int myReviewDelete(String reviewNum) {
		return mapper2.myReviewDelete(reviewNum);
	}
	
	
}
