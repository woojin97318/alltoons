package com.alltoons.root;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@GetMapping("/index")
	public String index() {
		return "common/alertHref";
	}
	@GetMapping("/main")
	public String main() {
		return "main/main";
	}
}
