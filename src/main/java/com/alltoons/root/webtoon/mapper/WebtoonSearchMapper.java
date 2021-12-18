package com.alltoons.root.webtoon.mapper;

import java.util.ArrayList;

import com.alltoons.root.admin.dto.WebtoonDTO;

public interface WebtoonSearchMapper {
	public ArrayList<WebtoonDTO> writerList(String search);
	public ArrayList<WebtoonDTO> titleList(String search);
	public String getplatformAll(int webtoonNum);
	public String getplatFirst(int webtoonNum);
	public int platCnt(int webtoonNum);
}
