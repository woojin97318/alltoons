package com.alltoons.root.mail.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSenderImpl;

public interface MailService {
	public void mailSend(HttpServletRequest request, String uEmail);
}
