package com.alltoons.root.admin.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.dto.WebtoonDTO;


public interface WebtoonService {
	public static final String WEBTOON_IMAGE="C:/alltoonsImage/webtoon";
	int upload(MultipartHttpServletRequest mul, WebtoonDTO wd);

	

}
