package com.alltoons.root.webtoon.mapper;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;

public interface WebtoonSearchMapper {
	public ArrayList<WebtoonDTO> writerList(String parameter);
	public ArrayList<WebtoonDTO> titleList(String parameter);
	public ArrayList<WebtoonDTO> webtoonAllList(Model model);
	public WebtoonDTO getImageFileName(int webtoonNum);
}
