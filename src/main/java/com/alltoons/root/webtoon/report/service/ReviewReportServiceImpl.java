package com.alltoons.root.webtoon.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alltoons.root.webtoon.report.dto.ReviewReportDTO;
import com.alltoons.root.webtoon.report.mapper.ReviewReportMapper;

@Service("reviewReportService")
public class ReviewReportServiceImpl implements ReviewReportService {
	@Autowired ReviewReportMapper mapper;

	@Override
	public int setReport(ReviewReportDTO dto) {
		return mapper.setReport(dto);
	}

	@Override
	public int getMyreportChk(String userEmail, int reviewNum) {	
		ReviewReportDTO dto = mapper.getMyreportChk(userEmail, reviewNum);
		if(dto == null) return 0; // 데이터 없을 때
		else return 1; // 데이터 있을 때
	}
}
