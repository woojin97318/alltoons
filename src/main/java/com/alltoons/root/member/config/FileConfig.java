package com.alltoons.root.member.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileConfig {
	@Bean //Bean을 작성해야 업로드 처리가 가능
	public CommonsMultipartResolver multipartResolver() { //메소드명은 고정
		CommonsMultipartResolver mr = new CommonsMultipartResolver();
		mr.setMaxUploadSize(52428800); //50MB
		mr.setDefaultEncoding("utf-8");
		return mr;
	}
}
