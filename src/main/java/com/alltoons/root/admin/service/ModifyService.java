package com.alltoons.root.admin.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;

public interface ModifyService {
	public static final String WEBTOON_IMAGE="C:/alltoonsImage/webtoon";
	WebtoonDTO list(String string, Model model);
	ArrayList<PlatformDTO> selectLinks(String parameter);
}
