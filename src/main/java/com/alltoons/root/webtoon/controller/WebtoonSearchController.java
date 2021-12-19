package com.alltoons.root.webtoon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.webtoon.service.WebtoonSearchService;

@Controller
public class WebtoonSearchController {
	@Autowired WebtoonSearchService SearchSvc;
	
	@PostMapping("webtoonSearch")//검색창
	public String webtoonSearch(@RequestParam("search") String search,
								HttpServletRequest request,
								Model model) {
		System.out.println("검색어: "+search);
		model.addAttribute("search", search);
		SearchSvc.searchList(search, model);
		
		return "main/webtoonSearch";
	}
}
