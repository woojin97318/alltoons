package com.alltoons.root.admin.upload.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.upload.dto.GenreDTO;
import com.alltoons.root.admin.upload.dto.OriginDTO;
import com.alltoons.root.admin.upload.dto.PlatformDTO;
import com.alltoons.root.admin.upload.dto.WebtoonDTO;
import com.alltoons.root.admin.upload.service.WebtoonService;

@Controller
public class AdminUploadController {
	@Autowired
	WebtoonService ws;
	
	@GetMapping("/webtoonUpload")
	public String webtoonUpload() {
		return "admin/webtoonUpload";
	}

	@PostMapping("/webtoonUpload")
	public String postWebtoonUpload(MultipartHttpServletRequest mul, WebtoonDTO wd) {
		if (wd.getOriginalPlatform().equals("nan")) {
			wd.setWebtoonOriginalLink("nan");
		}
		ws.upload(mul,wd);
		return "redirect:webtoonUpload";
	}
}
