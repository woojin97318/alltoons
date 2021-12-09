package com.alltoons.root.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.service.WebtoonService;


@Controller
public class AdminUploadController {
	@Autowired
	WebtoonService ws;

	@GetMapping("/webtoonUpload")
	public String webtoonUpload() {
		return "admin/webtoonUpload";
	}

	@PostMapping("/webtoonUpload")
	public String postWebtoonUpload(MultipartHttpServletRequest mul, WebtoonDTO wd, Model model) {
		if (wd.getWebtoonTitle().isEmpty()) {
			model.addAttribute("message", "작품 제목을 입력해주세요.");
			model.addAttribute("url", "webtoonUpload");
			return "/common/alertHref";
		} else {
			if (wd.getOriginalPlatform().equals("nan")) {
				wd.setWebtoonOriginalLink("nan");
			}
			//int cnt = ws.linkNum(mul);
			String arry[] = mul.getParameterValues("platformName");
			String arry2[] = mul.getParameterValues("webtoonLink");
			for(int i=0;i<arry.length;i++) {
				System.out.println(arry[i]);
				System.out.println(arry2[i]);
			}
			
			int result = ws.upload(mul, wd);
			if(result ==1) {
				model.addAttribute("message", "작품이 추가되었습니다");
				model.addAttribute("url", "webtoonUpload");
				return "/common/alertHref";
			}else {
				model.addAttribute("message", "작품 추가에 실패하였습니다.");
				model.addAttribute("url", "webtoonUpload");
				return "/common/alertHref";
			}
			
		}
	}
}
