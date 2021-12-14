package com.alltoons.root.admin.mapper;

import java.util.ArrayList;

import com.alltoons.root.admin.dto.ReportDTO;

public interface ReportMapper {
	public ArrayList<ReportDTO> getReport();
	public int reportDelete(int reportNum);
	public int reportReviewDel(int reviewNum);
}
