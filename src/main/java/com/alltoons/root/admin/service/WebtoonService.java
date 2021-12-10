package com.alltoons.root.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;


public interface WebtoonService {
	public static final String WEBTOON_IMAGE="C:/alltoonsImage/webtoon";
	int upload(MultipartHttpServletRequest mul, WebtoonDTO wd);
	WebtoonDTO list(String string, Model model);
	ArrayList<PlatformDTO> selectLinks(String parameter);

	

}
