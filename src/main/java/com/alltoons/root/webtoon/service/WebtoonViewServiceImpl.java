package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.mapper.WebtoonMapper;
import com.alltoons.root.common.MemberSessionName;
import com.alltoons.root.favorites.dto.FavoritesDTO;
import com.alltoons.root.member.service.MemberService;
import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;
import com.alltoons.root.webtoon.dto.WebtoonOriginDTO;
import com.alltoons.root.webtoon.dto.WebtoonPlatformDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.mapper.WebtoonViewMapper;

@Service
public class WebtoonViewServiceImpl implements WebtoonViewService {
	@Autowired
	WebtoonViewMapper wvm;

	@Override
	public void webtoonData(String webtoonNum, WebtoonViewDTO wvd, Model model) {
		wvd = wvm.webtoonData(webtoonNum);
		model.addAttribute("webtoonDate", wvd);

		ArrayList<WebtoonPlatformDTO> platformList = wvm.platformList(webtoonNum);
		model.addAttribute("platformList", platformList);

		ArrayList<WebtoonOriginDTO> originList = wvm.originList(webtoonNum);
		model.addAttribute("originList", originList);

		// 링크 수
		int cnt = wvm.linkCount(webtoonNum);
		System.out.println("링크수: " + cnt);
		model.addAttribute("linkCount", cnt);
	}

	@Override
	public void favorites(String webtoonNum, FavoritesDTO fd, Model model, HttpSession session) {
		String userEmail = (String) session.getAttribute(MemberSessionName.LOGIN);
		if (userEmail == null) {
			fd.setFavorites('F');
			fd.setInterest('F');
		} else {
			fd = wvm.check(webtoonNum, userEmail);
		} // 세션 아이디값
		System.out.println(MemberSessionName.LOGIN);
		model.addAttribute("favoritesDTO", fd);

		// 숫자
		int favoritesCount = wvm.favortiesCount(webtoonNum);
		int intesrestCount = wvm.intesrestCount(webtoonNum);
		model.addAttribute("favoritesCount", favoritesCount);
		model.addAttribute("intesrestCount", intesrestCount);
	}

	@Override
	public int interestClick(String webtoonNum, String userEmail) {
		FavoritesDTO fd = wvm.check(webtoonNum, userEmail);
		if (fd == null) {// 즐겨찾기 테이블 첫 사용
			wvm.insertInterest(webtoonNum, userEmail);
			fd = new FavoritesDTO();
			fd.setUserEmail(userEmail);
			fd.setWebtoonNum(Integer.parseInt(webtoonNum));
			fd.setInterest('T');
		} else {
			if (fd.getInterest() == 'T') {
				fd.setInterest('F');
			} else {
				fd.setInterest('T');
			}
		}
		wvm.interestClick(fd);
		int intesrestCount = wvm.intesrestCount(webtoonNum);
		return intesrestCount;
	}

	@Override
	public int favoritesClick(String webtoonNum, String userEmail) {
		FavoritesDTO fd = wvm.check(webtoonNum, userEmail);
		if (fd == null) {// 즐겨찾기 테이블 첫 사용
			wvm.insertFavorties(webtoonNum, userEmail);
			fd = new FavoritesDTO();
			fd.setUserEmail(userEmail);
			fd.setWebtoonNum(Integer.parseInt(webtoonNum));
			fd.setFavorites('T');
		} else {
			if (fd.getFavorites() == 'T') {
				fd.setFavorites('F');
			} else {
				fd.setFavorites('T');
			}
		}
		wvm.favoritesClick(fd);
		int favortiesCount = wvm.favortiesCount(webtoonNum);
		return favortiesCount;
	}

	@Override // 재 사용 가능 메소드
	public FavoritesDTO onOff(FavoritesDTO fd, String webtoonNum, String userEmail) {
		fd = wvm.check(webtoonNum, userEmail);
		return fd;
	}

	@Override
	public void platformView(Model model, String platformName) {
		// 웹툰 명,작가,썸네일,플랫폼,웹툰 번호 ==>상세페이지로 웹툰 num만 넘겨줌
		ArrayList<WebtoonCategoryDTO> platformView = wvm.platformView(platformName);
		model.addAttribute("platformView", platformView);

	}

	@Override
	public void genreView(Model model, String webtoonGenre) {
		ArrayList<WebtoonCategoryDTO> genreView = wvm.genreView(webtoonGenre);
		model.addAttribute("genreView", genreView);
	}

}
