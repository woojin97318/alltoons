package com.alltoons.root.admin.upload.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminUploadController {
	@GetMapping("/webtoonUpload")
	public String webtoonUpload() {
		return "admin/webtoonUpload";
	}
}
