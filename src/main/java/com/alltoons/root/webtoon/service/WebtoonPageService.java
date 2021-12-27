package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;

public interface WebtoonPageService {

	ArrayList<WebtoonCategoryDTO> sortNameAjax(String sort, String platformName, String start, String limit);

	void platformView(Model model, String platformName, String start);

	ArrayList<WebtoonCategoryDTO> genreSortAjax(String sort, String webtoonGenre, String start, String limit);

}
