package com.alltoons.root.webtoon.review.service;

import org.springframework.ui.Model;

public interface ReviewService {
	public void getReviewCnt(Model model, int webtoonNum);
	public void getMyReview(Model model, int webtoonNum, String userEmail);
	public void getAllReview(Model model, int webtoonNum, String userEmail);
	public int setReview(int webtoonNum, String userEmail, String reviewContent);
}
