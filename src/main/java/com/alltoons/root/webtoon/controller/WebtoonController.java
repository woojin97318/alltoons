package com.alltoons.root.webtoon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.webtoon.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.service.WebtoonViewService;

@Controller
public class WebtoonController {
	@Autowired WebtoonViewService ws;
	
	@GetMapping("webtooninfo")
	public String webtooninfo(@RequestParam String webtoonNum,Model model,WebtoonViewDTO wvd,FavoritesDTO fd) {
		//model.addAttribute("webtoonNum",webtoonNum);
		//전체를 다 받아서 model로 넘기자 
		ws.webtoonData(webtoonNum,wvd,model);
		ws.favorites(webtoonNum,fd,model);
		return "webtoonview/webtoonInfo";
	}
	
	@GetMapping("interest")
	public String interest() {
		return"";
	}
	
}
