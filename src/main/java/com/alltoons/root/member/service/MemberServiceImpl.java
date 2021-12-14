package com.alltoons.root.member.service;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.member.dto.MemberDTO;
import com.alltoons.root.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper mapper;

	@Autowired
	JavaMailSender mailSender;

	BCryptPasswordEncoder encoder;

	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}

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
	public String userChk(String userEmail, String userPw) {
		MemberDTO dto = mapper.userChk(userEmail);
		if (dto == null) {
			return "가입된 사용자가 아닙니다"; // 이메일 없음
		} else if (userEmail.equals(dto.getUserEmail()) && encoder.matches(userPw, dto.getUserPassword())) {
			return "로그인 성공"; // 로그인 성공
		} else {
			return "비밀번호가 틀립니다"; // 비밀번호 틀림
		}
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

			File saveFile = new File(IMAGE_REPO + "/" + sysFileName);
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			dto.setUserImage("default_image.png");
		}
		// DB에 가입하려는 회원정보 저장
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
	public int emailChk(String email) {
		MemberDTO dto = mapper.emailChk(email);
		if (dto == null) {
			return 0;
		} else {
			return 1;
		}
	}

	@Override
	public String newPassword(String email) {
		Random ran = new Random();
		String str = "";
		int num;
		while (str.length() != 8) {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				str += (char) num;
			} else {
				continue;
			}
		}

		String codedStr = encoder.encode(str);
		System.out.println(email);
		System.out.println(str);
		System.out.println("암호화된 임시비밀번호" + codedStr);
		mapper.updatePassword(codedStr, email);
		return str;

	}

}
