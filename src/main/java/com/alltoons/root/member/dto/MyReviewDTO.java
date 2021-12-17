package com.alltoons.root.member.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MyReviewDTO {
	private int reviewNum;
	private String reviewContent;
	private String reviewTime;
	private int webtoonNum;
	private String webtoonImage;
	private String webtoonTitle;
	
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
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
