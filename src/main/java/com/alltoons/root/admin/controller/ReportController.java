package com.alltoons.root.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.admin.service.ReportService;

@Controller
@RequestMapping("admin")
public class ReportController {
	@Autowired ReportService rs;

	@GetMapping("report")
	public String report(Model model) {
		rs.getReport(model);
		return "admin/reportPage";
	}
	@GetMapping("reportDel")
	public String reportDel(@RequestParam int reportNum, Model model) {
		int result = rs.reportDelete(reportNum);
		String message, url = "/admin/report";
		if(result == 1) {
			message = "신고내용이 삭제되었습니다";
		}else {
			message = "신고내용 삭제 Error";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}
	@GetMapping("reportReviewDel")
	public String reportReviewDel(@RequestParam int reviewNum, Model model) {
		int result = rs.reportReviewDel(reviewNum);
		String message, url = "/admin/report";
		if(result == 1) {
			message = "신고된 리뷰가 삭제되었습니다";
		}else {
			message = "신고된 리뷰 삭제 Error";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", url);
		return "/common/alertHref";
	}
}
