package com.alltoons.root.webtoon.mapper;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.webtoon.dto.WebtoonPlatformDTO;

public interface WebtoonSearchMapper {
	public ArrayList<WebtoonDTO> writerList(String search);
	public ArrayList<WebtoonDTO> titleList(String search);
	public String getplatformName(int webtoonNum);
	
}
