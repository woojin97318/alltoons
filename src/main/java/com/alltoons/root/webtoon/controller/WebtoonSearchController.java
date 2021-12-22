package com.alltoons.root.webtoon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.webtoon.service.WebtoonSearchService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("main")
public class WebtoonSearchController {
	@Autowired WebtoonSearchService SearchSvc;
	
	//검색창
	@PostMapping("webtoonSearch")
	public String webtoonSearch(@RequestParam("search") String search,
								HttpServletRequest request,
								Model model) {
		search = search.trim();
		
		System.out.println("검색어: "+search);
		model.addAttribute("search", search);
		search = search.toLowerCase();//영어라면 소문자로 변환
		System.out.println(search);
		ArrayList<WebtoonDTO> webtoonList = SearchSvc.searchList(search, model, "titleList");
		if(webtoonList.size()!=0) {
			model.addAttribute("webtoonList", webtoonList);
		}
		return "main/webtoonSearch";
	}
	
	@PostMapping("webtoonSearch/result")
	@ResponseBody
	public ArrayList<WebtoonDTO> webtoonSearch(@Param("search") String search,
								@Param("view") String view,
								HttpServletRequest request,
								HttpServletResponse response,
								Model model) {
		search = search.trim();
		ArrayList<WebtoonDTO> webtoonList = new ArrayList<WebtoonDTO>();
		System.out.println("ajax 실행 / "+view);
		webtoonList = SearchSvc.searchList(search, model, view);
		System.out.println("ajax 완료 / "+view+"\n"+webtoonList);
		return webtoonList;
	}
}
