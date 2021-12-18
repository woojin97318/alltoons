package com.alltoons.root.webtoon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.favorites.dto.FavoritesDTO;
import com.alltoons.root.member.service.MemberService;
import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.review.service.ReviewService;
import com.alltoons.root.webtoon.service.WebtoonViewService;

@Controller
public class WebtoonController {
	@Autowired
	WebtoonViewService ws;
	@Autowired
	ReviewService rs;
	@Autowired
	MemberService ms;

	@GetMapping("webtoon/webtooninfo")
	public String webtooninfo(HttpSession session, @RequestParam String webtoonNum, Model model, WebtoonViewDTO wvd,
			FavoritesDTO fd) {
		// 전체를 다 받아서 model로 넘기자
		ws.webtoonData(webtoonNum, wvd, model);
		ws.favorites(webtoonNum, fd, model, session);

		// 리뷰
		rs.getReviewCnt(model, Integer.parseInt(webtoonNum));
		rs.getMyReview(model, Integer.parseInt(webtoonNum), (String) session.getAttribute(MemberSessionName.LOGIN));
		rs.getAllReview(model, Integer.parseInt(webtoonNum), (String) session.getAttribute(MemberSessionName.LOGIN));
		return "webtoonview/webtoonInfo";
	}

	@GetMapping("webtoon/myReviewDel")
	public String myReviewDel(@RequestParam("reviewNum") int reviewNum, @RequestParam("webtoonNum") int webtoonNum,
			Model model) {
		int result = ms.myReviewDelete(reviewNum);
		String message;
		if (result == 1) {
			message = "삭제가 완료되었습니다";
		} else {
			message = "삭제 Error";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "webtooninfo?webtoonNum=" + webtoonNum);
		return "/common/alertHref";
	}

	@PostMapping("webtoon/reviewInsert")
	public String reviewInsert(@RequestParam("webtoonNum") int webtoonNum, @RequestParam("userEmail") String userEmail,
			@RequestParam("reviewContent") String reviewContent, Model model) {
		String message;
		if (rs.setReview(webtoonNum, userEmail, reviewContent) == 1) {
			message = "리뷰가 작성되었습니다";
		} else {
			message = "리뷰 작성 Error";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "webtooninfo?webtoonNum=" + webtoonNum);
		return "/common/alertHref";
	}

	//관심 클릭시 수 변경
	@GetMapping("webtoon/interestClick")
	@ResponseBody
	public String interest(@RequestParam("webtoonNum") String webtoonNum, @RequestParam("userEmail") String userEmail) {
		System.out.println("웹툰 번호: " + webtoonNum);
		System.out.println("이메일: " + userEmail);
		int cnt = ws.interestClick(webtoonNum, userEmail);
		return cnt + "";
	}
	
	//즐겨찾기 클릭시 수 변경
	@GetMapping("webtoon/favoritesClick")
	@ResponseBody
	public String favorites(@RequestParam("webtoonNum") String webtoonNum,
			@RequestParam("userEmail") String userEmail) {
		System.out.println("웹툰 번호: " + webtoonNum);
		System.out.println("이메일: " + userEmail);
		int cnt = ws.favoritesClick(webtoonNum, userEmail);
		return cnt + "";
	}
	
	//관심버튼 T,F값을 jsp에 넘김 -> 하트 꺼짐 켜짐
	@GetMapping("webtoon/i_onOff")
	@ResponseBody
	public String i_onOff(FavoritesDTO fd, @RequestParam("webtoonNum") String webtoonNum,
			@RequestParam("userEmail") String userEmail) {
		fd = ws.onOff(fd, webtoonNum, userEmail);// 메소드만 재사용
		return fd.getInterest() + "";
	}
	
	//즐겨찾기버튼 T,F값을 jsp에 넘김 -> 별 꺼짐 켜짐
	@GetMapping("webtoon/f_onOff")
	@ResponseBody
	public String f_onOff(FavoritesDTO fd, @RequestParam("webtoonNum") String webtoonNum,
			@RequestParam("userEmail") String userEmail) {
		fd = ws.onOff(fd, webtoonNum, userEmail);
		return fd.getFavorites() + "";
	}

	// 플랫폼 view
	@GetMapping("/webtoon/platformWebtoon")
	public String platformWebtoon(Model model, @RequestParam(required = false) String platformName) {
		if (platformName == null) {
			platformName = "navar";// default값
		}
		ws.platformView(model, platformName);
		return "webtoonview/platformWebtoon";
	}

	// 장르 view
	@GetMapping("/webtoon/genreWebtoon")
	public String genreWebtoon(Model model, @RequestParam(required = false) String webtoonGenre) {
		if (webtoonGenre == null) {
			webtoonGenre = "g1";// default값
		}
		ws.genreView(model, webtoonGenre);
		return "webtoonview/genreWebtoon";
	}

	// 즐겨찾기
	@GetMapping("/member/favorites")
	public String favorties(Model model, HttpSession session) {
		if ((String) session.getAttribute(MemberSessionName.LOGIN) == null) {
			model.addAttribute("message", "로그인이 필요한 기능입니다");
			model.addAttribute("url", "/member/login");
			return "common/alertHref"; // 임시 ->후에 인터셉터 필요
		}

		ws.favortiesPage(model, (String) session.getAttribute(MemberSessionName.LOGIN));
		return "webtoonview/favoritesWebtoon";
	}

	// 관심
	@GetMapping("/member/interest")
	public String interest(Model model, HttpSession session) {
		if ((String) session.getAttribute(MemberSessionName.LOGIN) == null) {
			model.addAttribute("message", "로그인이 필요한 기능입니다");
			model.addAttribute("url", "/member/login");
			return "common/alertHref"; // 임시 ->후에 인터셉터 필요
		}

		ws.interestPage(model, (String) session.getAttribute(MemberSessionName.LOGIN));
		return "webtoonview/interestWebtoon";
	}
	
	// 플랫폼 ajax
	@PostMapping("/webtoon/platformWebtoon")
	@ResponseBody
	public ArrayList<WebtoonCategoryDTO> platformAjax(Model model, @RequestParam(required = false) String platformName) {
		System.out.println("controller platformAjax:" + platformName);
		ArrayList<WebtoonCategoryDTO> platformAjax = ws.platformAjax(model, platformName);
		return platformAjax;
	}
	
	// 장르 ajax
	@PostMapping("/webtoon/genreWebtoon")
	@ResponseBody
	public ArrayList<WebtoonCategoryDTO> genreAjax(Model model, @RequestParam(required = false) String webtoonGenre) {
		ArrayList<WebtoonCategoryDTO> platformAjax = ws.genreAjax(model, webtoonGenre);
		return platformAjax;
	}

}
