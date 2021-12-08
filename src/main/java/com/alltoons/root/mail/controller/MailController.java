package com.alltoons.root.mail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alltoons.root.mail.service.MailService;

//@Controller
//@RequestMapping("/member")
public class MailController {
	
	@Autowired
	MailService mailService;
	
	@PostMapping("email")
	private int sendEmail(HttpServletRequest request, String uEmail) {
		HttpSession session = request.getSession();
//		mailService.mailSend(session, uEmail);
		return 123;
	}

}
