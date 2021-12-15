package com.alltoons.root.webtoon.report.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.webtoon.report.dto.ReviewReportDTO;
import com.alltoons.root.webtoon.report.service.ReviewReportService;

@Controller
@RequestMapping("webtoon")
public class ReviewReportController implements MemberSessionName {
	@Autowired ReviewReportService rrs;

	@GetMapping("report")
	public String report(@RequestParam int reviewNum, Model model, HttpSession session) {
		model.addAttribute("reportUserEmail", (String)session.getAttribute(LOGIN));
		model.addAttribute("reviewNum", reviewNum);
		return "report";
	}

	@PostMapping("reportinsert")
	public String reportinsert(ReviewReportDTO dto, Model model) {
		int result = rrs.setReport(dto);
		String message, url = "";
		if(result == 1) message = "신고가 완료되었습니다";
		else message = "신고하기 Error";
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}
}
