package com.alltoons.root.webtoon.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
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
}
