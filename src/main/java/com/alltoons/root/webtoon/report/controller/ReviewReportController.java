package com.alltoons.root.webtoon.report.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alltoons.root.webtoon.report.dto.ReviewReportDTO;
import com.alltoons.root.webtoon.report.service.ReviewReportService;

@Controller
@RequestMapping("report")
public class ReviewReportController {
	@Autowired ReviewReportService rrs;

//	@GetMapping("reviewReport")
//	public String reviewReport(Model model, HttpSession session, 리뷰식별번호) {
//		model.addAttribute("reportUserEmail", session.getAttribute(LOGIN).toString());
//		model.addAttribute("reviewNum", 리뷰식별번호);
//		return "report";
//	}
//
//	@PostMapping("reportinsert")
//	public String reportinsert(ReviewReportDTO dto, Model model) {
//		int result = rrs.setReport(dto);
//		String message, url = "";
//		if(result == 1) message = "신고가 완료되었습니다";
//		else message = "신고하기 Error";
//		model.addAttribute("message", message);
//		model.addAttribute("url", url);
//		return "/common/alertHref";
//	}
}
