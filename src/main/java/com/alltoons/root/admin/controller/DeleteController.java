package com.alltoons.root.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.service.DeleteService;
@Controller
@RequestMapping("admin")
public class DeleteController {
	@Autowired DeleteService dele;
	
	@GetMapping("webtoonDelete")
	public String delete(Model model) {
		dele.webtoonAllList(model);
		return "admin/webtoonDelete";
	}
	
	@PostMapping("webtoonDelete")
	public String delete(HttpServletRequest request, Model model) {
		dele.webtoonAllList(model);
		dele.searchList(request.getParameter("search"), model);
		return "admin/webtoonDelete";
	}
	
	@GetMapping("deleteWebtoon")
	public String deleteWebtoon(@RequestParam("webtoonNum") int webtoonNum, 
								@RequestParam("imageFileName") String webtoonImage,
								HttpServletResponse response,
								Model model) {
		
		String message = dele.deleteImage(webtoonNum, webtoonImage);//이미지 파일 삭제
		System.out.println(message);//message="삭제되었습니다."
		
		dele.deleteWebtoon(webtoonNum);//db삭제
		
		model.addAttribute("message", message);
		model.addAttribute("url", "/admin/webtoonDelete");
		
		dele.webtoonAllList(model);
		//return "admin/webtoonDelete";
		return "common/alertHref";
	}
	
	@PostMapping("webtoonDeletePaging")
	@ResponseBody
	public ArrayList<WebtoonDTO> postDelete(@RequestParam String start,
			@RequestParam String limit) {
		System.out.println("start value"+start);
		ArrayList<WebtoonDTO> dto = dele.webtoonAllList(start,limit);
		return dto;
	}
}
