package com.alltoons.root.webtoon.report.service;

import com.alltoons.root.webtoon.report.dto.ReviewReportDTO;

public interface ReviewReportService {
	public int setReport(ReviewReportDTO dto);
	public int getMyreportChk(String userEmail, int reviewNum);
}
