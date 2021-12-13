package com.alltoons.root.webtoon.report.dto;

public class ReviewReportDTO {
	private int reportNum;
	private String reportUserEmail;
	private String reportContent;
	private String reportTime;
	private int reviewNum;
	
	public int getReportNum() {
		return reportNum;
	}
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	public String getReportUserEmail() {
		return reportUserEmail;
	}
	public void setReportUserEmail(String reportUserEmail) {
		this.reportUserEmail = reportUserEmail;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
}
