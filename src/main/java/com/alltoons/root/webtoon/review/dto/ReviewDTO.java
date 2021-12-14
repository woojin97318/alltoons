package com.alltoons.root.webtoon.review.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReviewDTO {
	private String userImage;
	private String userEmail;
	private String reviewContent;
	private String reviewTime;
	
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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
}
