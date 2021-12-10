package com.alltoons.root.review.dto;

public class MyReviewDTO {
	private int reviewNum;
	private String reviewContent;
	private String reviewTime;
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
	public void setReviewTime(String reviewTime) {
		this.reviewTime = reviewTime;
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
