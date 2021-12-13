package com.alltoons.root;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WebtoonSearch {
	@PostMapping("/webtoonSearch")
	public String webtoonSearch() {
		return "main/webtoonSearch";
	}
}
