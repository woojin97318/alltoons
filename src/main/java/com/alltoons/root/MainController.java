package com.alltoons.root;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.common.interceptor.service.InterceptorService;
import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;
import com.alltoons.root.webtoon.service.WebtoonViewService;

@Controller
public class MainController implements MemberSessionName {
	@Autowired
	WebtoonViewService ws;
	@Autowired
	InterceptorService is;

	@GetMapping("main")
	public String main(Model model, HttpSession session,@RequestParam(required = false) String start,
			@RequestParam(required = false) String limit) {
		if(start == null) {
			start =Integer.toString(1);
			limit =Integer.toString(30);
		}
		ws.popularWebtoon(model,start,limit);
		
		if(session.getAttribute(LOGIN) != null)
			model.addAttribute("division", is.getDivision(session.getAttribute(LOGIN).toString()));
		return "main/main";
	}
	@PostMapping("main") //append용
	@ResponseBody
	public ArrayList<WebtoonCategoryDTO> posstMain(Model model, HttpSession session,@RequestParam(required = false) String start,
			@RequestParam(required = false) String limit) {
		ArrayList<WebtoonCategoryDTO> popularPage = ws.popularWebtoon(model, start, limit);
		return popularPage;
	}
}
