package com.alltoons.root.webtoon.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("interestClick")
	@ResponseBody
	public String interest(@RequestParam("webtoonNum") String webtoonNum,@RequestParam("userEmail") String userEmail) {
		System.out.println("웹툰 번호: "+webtoonNum);
		System.out.println("이메일: "+userEmail);
		int cnt = ws.interestClick(webtoonNum,userEmail);
		return cnt+"";
	}
	
	@GetMapping("checkInterest")
	@ResponseBody
	public String checkInterest(@RequestParam("webtoonNum") String webtoonNum,@RequestParam("userEmail") String userEmail,FavoritesDTO fd) {
		System.out.println("웹툰 번호: "+webtoonNum);
		System.out.println("이메일: "+userEmail);
		fd = ws.check(webtoonNum,userEmail,fd);
		char checkResult = fd.getInterest();
		return checkResult+"" ;
	}
	
}
