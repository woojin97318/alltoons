package com.alltoons.root;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.common.interceptor.service.InterceptorService;
import com.alltoons.root.webtoon.service.WebtoonViewService;

@Controller
public class MainController implements MemberSessionName {
	@Autowired
	WebtoonViewService ws;
	@Autowired
	InterceptorService is;

	@GetMapping("/main")
	public String main(Model model, HttpSession session) {
		ws.popularWebtoon(model);
		
		if(session.getAttribute(LOGIN) != null)
			model.addAttribute("division", is.getDivision(session.getAttribute(LOGIN).toString()));
		return "main/main";
	}
}
