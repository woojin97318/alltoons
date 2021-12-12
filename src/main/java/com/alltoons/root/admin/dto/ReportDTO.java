package com.alltoons.root.admin.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReportDTO {
	private int reportNum;
	private String reportUserEmail;
	private String reportContent;
	private String reportTime;
	private int reviewNum;
	private String ReviewUserEmail;
	private String reviewContent;
	private String reviewTime;
	private int webtoonNum;
	private String webtoonImage;
	private String webtoonTitle;
	
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
	public void setReportTime(Timestamp reportTime) {
		SimpleDateFormat fo = new SimpleDateFormat("YYYY년MM월dd일 HH시mm분");
		this.reportTime = fo.format(reportTime);
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewUserEmail() {
		return ReviewUserEmail;
	}
	public void setReviewUserEmail(String reviewUserEmail) {
		ReviewUserEmail = reviewUserEmail;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewTime() {
		return reviewTime;
	}
	public void setReviewTime(Timestamp reviewTime) {
		SimpleDateFormat fo = new SimpleDateFormat("YYYY년MM월dd일 HH시mm분");
		this.reviewTime = fo.format(reviewTime);
	}
	public int getWebtoonNum() {
		return webtoonNum;
	}
	public void setWebtoonNum(int webtoonNum) {
		this.webtoonNum = webtoonNum;
	}
	public String getWebtoonImage() {
		return webtoonImage;
	}
	public void setWebtoonImage(String webtoonImage) {
		this.webtoonImage = webtoonImage;
	}
	public String getWebtoonTitle() {
		return webtoonTitle;
	}
	public void setWebtoonTitle(String webtoonTitle) {
		this.webtoonTitle = webtoonTitle;
	}
}
