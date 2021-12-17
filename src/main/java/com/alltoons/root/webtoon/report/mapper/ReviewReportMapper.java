package com.alltoons.root.webtoon.report.mapper;

import org.apache.ibatis.annotations.Param;

import com.alltoons.root.webtoon.report.dto.ReviewReportDTO;

public interface ReviewReportMapper {
	public int setReport(ReviewReportDTO dto);
	public ReviewReportDTO getMyreportChk(
			@Param("mail") String userEmail, @Param("rn") int reviewNum);
}
