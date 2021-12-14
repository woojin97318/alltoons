package com.alltoons.root.webtoon.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.alltoons.root.webtoon.service.WebtoonSearchService;

@Controller
public class WebtoonSearchController {
	@Autowired WebtoonSearchService SearchSvc;
	
	@PostMapping("/webtoonSearch")
	public String webtoonSearch(HttpServletRequest request, Model model) {
		SearchSvc.webtoonAllList(model);
		model.addAttribute(request.getParameter("search"), model);
		return "main/webtoonSearch";
	}
	
}
