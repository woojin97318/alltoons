package com.alltoons.root;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WebtoonSearchController {
	@PostMapping("/webtoonSearch")
	public String webtoonSearch() {
		return "main/webtoonSearch";
	}
}
