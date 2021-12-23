package com.alltoons.root.webtoon.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;

public interface WebtoonPageMapper {

	ArrayList<WebtoonCategoryDTO> platformPopularPage(
			@Param("platformName")String platformName, @Param("start")String start, 
			@Param("limit")String limit);

	ArrayList<WebtoonCategoryDTO> sortNameAjax(
			@Param("platformName")String platformName, @Param("sort")String sort, 
			@Param("start")String start, @Param("limit")String limit);

	ArrayList<WebtoonCategoryDTO> platformView(String platformName);

}
