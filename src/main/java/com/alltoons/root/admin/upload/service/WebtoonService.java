package com.alltoons.root.admin.upload.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.upload.dto.WebtoonDTO;

public interface WebtoonService {
	public static final String WEBTOON_IMAGE="C:/alltoonsImage/webtoon";
	void upload(MultipartHttpServletRequest mul, WebtoonDTO wd);

	

}
