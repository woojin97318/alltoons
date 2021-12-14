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
		ReviewDTO myReview = mapper.getMyReview(webtoonNum, userEmail);
		model.addAttribute("myReview", myReview);
	}

	@Override
	public void getAllReview(Model model, int webtoonNum) {
		ArrayList<ReviewDTO> reviewList = mapper.getAllReview(webtoonNum);
		model.addAttribute("reviewList", reviewList);
	}

}
