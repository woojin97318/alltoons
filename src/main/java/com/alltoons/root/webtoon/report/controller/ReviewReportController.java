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
	public String report(Model model, @RequestParam int reviewNum,
			@RequestParam("webtoonNum") int webtoonNum, HttpSession session) {
		
		int result = rrs.getMyreportChk((String)session.getAttribute(LOGIN), reviewNum);

		//if(result == 0) {
		if(result == 1) { //For debug 
			model.addAttribute("message", "이미 신고하신 리뷰입니다");
			//model.addAttribute("url", "/webtooninfo?webtoonNum=\" + webtoonNum");
			model.addAttribute("webtoonNum",webtoonNum);
			return "/common/alertHref";
		}else {
			model.addAttribute("reviewNum", reviewNum);
			model.addAttribute("webtoonNum", webtoonNum);
			return "report";
		}
	}
	
	@PostMapping("reportinsert")
	public String reportinsert(@RequestParam("webtoonNum") int webtoonNum,
			ReviewReportDTO dto, Model model) {
		int result = rrs.setReport(dto);
		System.out.println(webtoonNum);
		String message, url = "/webtooninfo?webtoonNum=" + webtoonNum;
		if(result == 1) message = "신고가 완료되었습니다";
		else message = "신고하기 Error";
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}
}
