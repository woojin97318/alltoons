package com.alltoons.root.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.ReportDTO;
import com.alltoons.root.admin.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired ReportMapper mapper;

	@Override
	public void getReport(Model model) {
		ArrayList<ReportDTO> list =  mapper.getReport();
		model.addAttribute("reportList", list);
	}

	@Override
	public int reportDelete(int reportNum) {
		return mapper.reportDelete(reportNum);
	}

	@Override
	public int reportReviewDel(int reviewNum) {
		return mapper.reportReviewDel(reviewNum);
	}
}
