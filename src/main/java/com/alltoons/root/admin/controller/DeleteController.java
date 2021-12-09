package com.alltoons.root.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.admin.service.DeleteService;
@Controller
public class DeleteController {
	@Autowired DeleteService dele;
	
	@GetMapping("/delete")
	public String delete() {
		return "admin/webtoonDelete";
	}
	@PostMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		dele.webtoonAllList(model);
		dele.searchList(request.getParameter("search"), model);
		return "admin/webtoonDelete";
	}
	@GetMapping("/deleteWebtoon")
	public String deleteWebtoon(@RequestParam int webtoonNum) {
		dele.deleteWebtoon(webtoonNum);
		return "admin/webtoonDelete";
	}
}
