package com.alltoons.root.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;

public interface DeleteMapper {
	public ArrayList<WebtoonDTO> writerList(String parameter);
	public ArrayList<WebtoonDTO> titleList(String parameter);
	public int deleteWebtoon(int webtoonNum);
	public ArrayList<WebtoonDTO> webtoonAllList(Model model);
	public WebtoonDTO getImageFileName(int webtoonNum);
	public ArrayList<WebtoonDTO> paging(@Param("start") String start, @Param("limit")String limit);
}
