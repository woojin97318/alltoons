package com.alltoons.root.mail.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.sun.mail.util.logging.MailHandler;

public class MailServiceImpl implements MailService{

	@Override
	public void mailSend(HttpServletRequest request, String uEmail) {
		try {
			MailHandler mailHandler = new MailHandler(JavaMailSenderImpl);
		} catch (Exception e) {
		}
	}

}
