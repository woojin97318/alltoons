package com.alltoons.root.admin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.dto.GenreDTO;
import com.alltoons.root.admin.dto.OriginDTO;
import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;

public interface ModifyService {
	public static final String WEBTOON_IMAGE="C:/alltoonsImage/webtoon";
	WebtoonDTO list(String string, Model model);
	ArrayList<PlatformDTO> selectLinks(String parameter);
	int modify(MultipartHttpServletRequest mul, WebtoonDTO wd);
	ArrayList<OriginDTO> selectOriginLinks(String webtoonNum);
	ArrayList<GenreDTO> selectwebtoonGenre(String webtoonNum);
}
