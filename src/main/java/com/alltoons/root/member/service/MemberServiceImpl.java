package com.alltoons.root.member.service;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.dto.MyReviewDTO;
import com.alltoons.root.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberMapper mapper;
	@Autowired JavaMailSender mailSender;

	BCryptPasswordEncoder encoder;

	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}

	@Override
	public int signUpForm(MultipartHttpServletRequest mul) {
		int result = 0;

		MemberDTO dto = new MemberDTO();
		dto.setUserEmail(mul.getParameter("userEmail"));
		dto.setUserPassword(encoder.encode(mul.getParameter("userPassword")));

		MultipartFile file = mul.getFile("userImage");
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
			result = mapper.signUpForm(dto);
			System.out.println("회원가입 성공");
		} catch (Exception e) {
			System.out.println("회원가입 실패");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String userChk(String userEmail, String userPw) {
		MemberDTO dto = mapper.userChk(userEmail);
		if (dto == null) //이메일 없음
			return "가입된 사용자가 아닙니다";
		else if (userEmail.equals(dto.getUserEmail()) &&
				encoder.matches(userPw, dto.getUserPassword())) //로그인 성공
			return "로그인 성공";
		else //비밀번호 틀림
			return "비밀번호가 틀립니다";
	}
	@Override
	public void keepLogin(String sessionId, Date limitDate, String userEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("userEmail", userEmail);
		mapper.keepLogin(map);
	}

	@Override
	public void getUserInfo(Model model, String userEmail) {
		model.addAttribute("userInfo", mapper.userChk(userEmail));
	}
	@Override
	public void getFavoritesInterest(Model model, String userEmail) {
		int favorites = mapper.getFavorites(userEmail);
		int interest = mapper.getInterest(userEmail);
		model.addAttribute("favorites", favorites);
		model.addAttribute("interest", interest);
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
			result = mapper.userImageModify(dto.getUserEmail(), dto.getUserImage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("mapper2.userImageModify 에러");
		}
		return result;
	}
	@Override
	public int userImageDefault(String userEmail) {
		return mapper.userImageDefault(userEmail);
	}

	@Override
	public String pwModifyChk(String userPw, String userEmail) {
		MemberDTO dto = mapper.userChk(userEmail);
		if(encoder.matches(userPw, dto.getUserPassword()))
			return "비밀번호확인";
		else
			return "비밀번호가 일치하지 않습니다";
	}
	@Override
	public void PasswordModify(String newUserPw, String userEmail) {
		newUserPw = encoder.encode(newUserPw);
		mapper.PasswordModify(newUserPw, userEmail);
	}
	@Override
	public String memberDeleteChk(String userPw, String userEmail) {
		MemberDTO dto = mapper.userChk(userEmail);
		if(encoder.matches(userPw, dto.getUserPassword())) {
			mapper.memberDelete(userEmail);//회원정보 삭제
			return "탈퇴가 완료되었습니다";
		}else {
			return "비밀번호가 일치하지 않습니다";
		}
	}

	@Override
	public void myReviewCnt(Model model, String userEmail) {
		int myReviewCnt = mapper.myReviewCnt(userEmail);
		model.addAttribute("myReviewCnt", myReviewCnt);
	}
	@Override
	public void myReviewContent(Model model, String userEmail) {
		ArrayList<MyReviewDTO> list = mapper.getMyReview(userEmail);
		model.addAttribute("myReview", list);
	}
	@Override
	public int myReviewDelete(int reviewNum) {
		return mapper.myReviewDelete(reviewNum);
	}

	@Override
	public String newPassword(String email) {
		Random ran = new Random();
		String str = "";
		int num;
		while (str.length() != 8) {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) ||
					(num >= 97 && num <= 122)) {
				str += (char) num;
			} else {
				continue;
			}
		}
		String codedStr = encoder.encode(str);
		mapper.updatePassword(codedStr, email);

		return str;
	}

	@Override
	public String rand() {
		Random ran = new Random();
		String str = "";
		int num;
		while (str.length() != 20) {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				str += (char) num;
			} else {
				continue;
			}
		}
		return str;
	}
	@Override
	public void sendMail(String to, String subject, String body) {

		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(body, true);

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public int emailChk(String email) {
		MemberDTO dto = mapper.emailChk(email);
		if (dto == null) return 0;
		else return 1;
	}
}
