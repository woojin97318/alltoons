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

	@Override
	public int getMyreportChk(String userEmail, int reviewNum) {	
		
		ReviewReportDTO dto = mapper.getMyreportChk(userEmail, reviewNum);
	
		if(dto != null) {
			//System.out.println("aa");
			return 0;
		}
		else {
			//System.out.println("bb");
			return 1;
		}
	}
}
