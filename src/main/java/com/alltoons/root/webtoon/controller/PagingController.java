package com.alltoons.root.webtoon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.paging.PagingVO;
import com.alltoons.root.webtoon.service.PagingService;

@Controller
public class PagingController {

	@Autowired
	PagingService pagingService;
	
	@GetMapping("/pagingList")
	public String webtoonList(PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required= false)String cntPerPage) {
		int total = pagingService.countWebtoon();
		WebtoonViewDTO dto = new WebtoonViewDTO();
				
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("webtoonList", pagingService.selectWebtoons(vo));
		return "webtoonview/webtoonPaging";
	}

}
