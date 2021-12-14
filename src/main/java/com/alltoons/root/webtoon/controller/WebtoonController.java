package com.alltoons.root.webtoon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.favorites.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.review.service.ReviewService;
import com.alltoons.root.webtoon.service.WebtoonViewService;

@Controller
public class WebtoonController {
	@Autowired
	WebtoonViewService ws;
	@Autowired
	ReviewService rs;

	@GetMapping("webtooninfo")
	public String webtooninfo(HttpSession session, @RequestParam String webtoonNum, Model model, WebtoonViewDTO wvd,
			FavoritesDTO fd) {
		// 전체를 다 받아서 model로 넘기자
		ws.webtoonData(webtoonNum, wvd, model);
		ws.favorites(webtoonNum, fd, model, session);

		// 리뷰
		rs.getReviewCnt(model, Integer.parseInt(webtoonNum));
		rs.getMyReview(model, Integer.parseInt(webtoonNum), (String)session.getAttribute(MemberSessionName.LOGIN));
		rs.getAllReview(model, Integer.parseInt(webtoonNum));
		return "webtoonview/webtoonInfo";
	}

	@GetMapping("interestClick")
	@ResponseBody
	public String interest(@RequestParam("webtoonNum") String webtoonNum, @RequestParam("userEmail") String userEmail) {
		System.out.println("웹툰 번호: " + webtoonNum);
		System.out.println("이메일: " + userEmail);
		int cnt = ws.interestClick(webtoonNum, userEmail);
		return cnt + "";
	}

	@GetMapping("favoritesClick")
	@ResponseBody
	public String favorites(@RequestParam("webtoonNum") String webtoonNum,
			@RequestParam("userEmail") String userEmail) {
		System.out.println("웹툰 번호: " + webtoonNum);
		System.out.println("이메일: " + userEmail);
		int cnt = ws.favoritesClick(webtoonNum, userEmail);
		return cnt + "";
	}

	@GetMapping("i_onOff")
	@ResponseBody
	public String i_onOff(FavoritesDTO fd, @RequestParam("webtoonNum") String webtoonNum,
			@RequestParam("userEmail") String userEmail) {
		System.out.println("도착");
		fd = ws.onOff(fd, webtoonNum, userEmail);// 메소드만 재사용
		return fd.getInterest() + "";
	}

	@GetMapping("f_onOff")
	@ResponseBody
	public String f_onOff(FavoritesDTO fd, @RequestParam("webtoonNum") String webtoonNum,
			@RequestParam("userEmail") String userEmail) {
		fd = ws.onOff(fd, webtoonNum, userEmail);
		return fd.getFavorites() + "";
	}

	// 플랫폼 view
	@GetMapping("platformWebtoon")
	public String platformWebtoon(Model model, @RequestParam(required = false) String platformName) {
		if (platformName == null) {
			platformName = "navar";// default값
		}
		ws.platformView(model, platformName);
		return "webtoonview/platformWebtoon";
	}
	// 장르 view
	@GetMapping("genreWebtoon")
	public String genreWebtoon(Model model, @RequestParam(required = false) String webtoonGenre) {
		if (webtoonGenre == null) {
			webtoonGenre = "g1";// default값
		}
		ws.genreView(model, webtoonGenre);
		return "webtoonview/genreWebtoon";
	}
}
