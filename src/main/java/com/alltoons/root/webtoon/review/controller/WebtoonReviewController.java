package com.alltoons.root.webtoon.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alltoons.root.member.service.MemberService2;
import com.alltoons.root.webtoon.review.service.ReviewService;

public class WebtoonReviewController {
	 @Autowired
	   ReviewService rs;
	   @Autowired
	   MemberService2 ms2;
	   
	   @GetMapping("myReviewDel")
	   public String myReviewDel(@RequestParam("reviewNum") int reviewNum,
	         @RequestParam("webtoonNum") int webtoonNum, Model model) {
	      int result = ms2.myReviewDelete(reviewNum);
	      String message;
	      if(result == 1) {
	         message = "삭제가 완료되었습니다";
	      }else {
	         message = "삭제 Error";
	      }
	      model.addAttribute("message", message);
	      model.addAttribute("url", "webtooninfo?webtoonNum=" + webtoonNum);
	      return "/common/alertHref";
	   }
	   @PostMapping("reviewInsert")
	   public String reviewInsert(@RequestParam("webtoonNum") int webtoonNum,
	         @RequestParam("userEmail") String userEmail,
	         @RequestParam("reviewContent") String reviewContent, Model model) {
	      String message;
	      if(rs.setReview(webtoonNum, userEmail, reviewContent) == 1) {
	         message = "리뷰가 작성되었습니다";
	      }else {
	         message = "리뷰 작성 Error";
	      }
	      model.addAttribute("message", message);
	      model.addAttribute("url", "webtooninfo?webtoonNum=" + webtoonNum);
	      return "/common/alertHref";
	   }
}
