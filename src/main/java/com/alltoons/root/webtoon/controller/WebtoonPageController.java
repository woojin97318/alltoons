package com.alltoons.root.webtoon.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;
import com.alltoons.root.webtoon.service.WebtoonPageService;

@Controller
public class WebtoonPageController {
	@Autowired
	WebtoonPageService wps;

	// 정렬 ajax - 페이징용
	@PostMapping("/webtoon/paging_sort")
	@ResponseBody
	public ArrayList<WebtoonCategoryDTO> sortAjax(@RequestParam("platformName") String platformName,
			@RequestParam(required = false) String sort, @RequestParam(required = false) String start,
			@RequestParam(required = false) String limit) {
		System.out.println("controller start " + start);
		ArrayList<WebtoonCategoryDTO> platformAjax = wps.sortNameAjax(sort, platformName, start, limit);
		System.out.println("controller: " + platformAjax.isEmpty());
		return platformAjax;
	}

	// 장르정렬 ajax
	@PostMapping("/webtoon/genre_Sort")
	@ResponseBody
	public ArrayList<WebtoonCategoryDTO> genreSortAjax(@RequestParam(required = false) String sort,
			@RequestParam(required = false) String webtoonGenre,
			@RequestParam(required = false) String start,
			@RequestParam(required = false) String limit) {
		ArrayList<WebtoonCategoryDTO> platformAjax = wps.genreSortAjax(sort, webtoonGenre,start,limit);
		return platformAjax;
	}
}
