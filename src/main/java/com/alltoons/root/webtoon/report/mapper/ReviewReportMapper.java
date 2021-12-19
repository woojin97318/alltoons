package com.alltoons.root.webtoon.report.mapper;

import org.apache.ibatis.annotations.Param;
import com.alltoons.root.webtoon.report.dto.ReviewReportDTO;

public interface ReviewReportMapper {
	public int setReport(ReviewReportDTO dto);
	public ReviewReportDTO getMyreportChk(
			@Param("userEmail") String userEmail, @Param("reviewNum") int reviewNum);
}
