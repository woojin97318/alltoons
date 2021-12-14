package com.alltoons.root.admin.service;

import org.springframework.ui.Model;

public interface ReportService {
	public void getReport(Model model);
	public int reportDelete(int reportNum);
	public int reportReviewDel(int reviewNum);
}
