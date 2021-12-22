package com.alltoons.root.webtoon.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.webtoon.review.dto.ReviewDTO;
import com.alltoons.root.webtoon.review.mapper.ReviewMapper;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired ReviewMapper mapper;
	
	@Override
	public void getReviewCnt(Model model, int webtoonNum) {
		model.addAttribute("reviewCnt", mapper.getReviewCnt(webtoonNum));
	}
	@Override
	public void getMyReview(Model model, int webtoonNum, String userEmail) {
		if(userEmail == null) {
			model.addAttribute("myReview", "n");
		}else {
			ReviewDTO myReview = mapper.getMyReview(webtoonNum, userEmail);
			model.addAttribute("myReview", myReview);
		}
	}
	@Override
	public void getAllReview(Model model, int webtoonNum, String userEmail) {
		ArrayList<ReviewDTO> reviewList;
		if(userEmail != null) 
			reviewList = mapper.getAllReview(webtoonNum, userEmail);
		else
			reviewList = mapper.getAllReview(webtoonNum, "로그인안함");
		model.addAttribute("reviewList", reviewList);
	}
	@Override
	public int setReview(int webtoonNum, String userEmail, String reviewContent) {
		return mapper.setReview(webtoonNum, userEmail, reviewContent);
	}
} 
