package com.alltoons.root.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.service.ModifyService;

@Controller
public class AdminModifyController {
	@Autowired
	ModifyService ms;

	@GetMapping("webtoonModify")
	public String webtoonModify(Model model, WebtoonDTO wd, HttpServletRequest request) {
		ArrayList<PlatformDTO> list = new ArrayList<PlatformDTO>();
		wd = ms.list(request.getParameter("webtoonNum"), model);// 웹툰 정보
		list = ms.selectLinks(request.getParameter("webtoonNum"));// 링크 주소들 들어있음
		model.addAttribute("webtoonList", wd);
		model.addAttribute("linkList", list);

		return "admin/webtoonModify";
	}

	@GetMapping("thumbnail")
	public void thumbnail(@RequestParam("webtoonImage") String webtoonImage, HttpServletResponse response)
			throws IOException {
		File img = new File(ModifyService.WEBTOON_IMAGE + "/" + webtoonImage);
		FileInputStream in = new FileInputStream(img);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}

	@PostMapping("webtoonModify")
	public String postWebtoonModify(MultipartHttpServletRequest mul, WebtoonDTO wd,Model model) {
		System.out.println("수정 컨트롤러");
		int result = ms.modify(mul, wd);
		if(result==1) {
			model.addAttribute("message", "작품이 수정되었습니다");
			model.addAttribute("url","test");//후에 합친 후에는 삭제list페이지로 이동
			return "/common/alertHref";
		}
		model.addAttribute("message", "작품 수정에 실패하였습니다");
		model.addAttribute("url", "webtoonModify?webtoonNm="+wd.getWebtoonNum());
		return "/common/alertHref";
	}

	@RequestMapping("test")
	public String test() {
		return "test";
	}

}
