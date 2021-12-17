package com.alltoons.root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.alltoons.root.webtoon.service.WebtoonViewService;

@Controller
public class MainController {
	@Autowired
	WebtoonViewService ws;

	@GetMapping("/main")
	public String main(Model model) {
		ws.popularWebtoon(model);
		return "main/main";
	}

}
