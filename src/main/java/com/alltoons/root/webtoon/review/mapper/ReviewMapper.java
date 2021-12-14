package com.alltoons.root.webtoon.review.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alltoons.root.webtoon.review.dto.ReviewDTO;

public interface ReviewMapper {
	public int getReviewCnt(int webtoonNum);
	public ReviewDTO getMyReview(
			@Param("wbnum") int webtoonNum,
			@Param("mail") String userEmail);
	public ArrayList<ReviewDTO> getAllReview(int webtoonNum);
}
