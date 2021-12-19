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
	
	//첫 화면 관심,즐겨찾기 버튼 onoff여부 
	@Override
	public void favorites(String webtoonNum, FavoritesDTO fd, Model model, HttpSession session) {
		String userEmail = (String) session.getAttribute(MemberSessionName.LOGIN);
		if (userEmail == null) {//로그인 X 인 고객
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
		} else {//기존 이력있을시 변경만
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
		} else {//기존 이력있을시 변경만
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
		System.out.println("platformName이름"+platformName);
		// 웹툰 명,작가,썸네일,플랫폼,웹툰 번호 ==>상세페이지로 웹툰 num만 넘겨줌
		ArrayList<WebtoonCategoryDTO> platformView = wvm.platformView(platformName);
		model.addAttribute("platformView", platformView);
	}

	@Override
	public void genreView(Model model, String webtoonGenre) {
		ArrayList<WebtoonCategoryDTO> genreView = wvm.genreView(webtoonGenre);
		model.addAttribute("genreView", genreView);
	}

	@Override
	public void favortiesPage(Model model, String userEmail) {
		ArrayList<WebtoonCategoryDTO> favortiesPage = wvm.favortiesPage(userEmail);
		favortiesPage = onlyPlatform(favortiesPage);
		model.addAttribute("favortiesPage", favortiesPage);
	}

	@Override
	public void interestPage(Model model, String userEmail) {
		ArrayList<WebtoonCategoryDTO> interestPage = wvm.interestPage(userEmail);
		interestPage = onlyPlatform(interestPage);
		model.addAttribute("interestPage", interestPage);
	}
	
	@Override	//인기페이지 작업 service
	public void popularWebtoon(Model model) {
		ArrayList<WebtoonCategoryDTO> popularPage = wvm.popularPage();
		popularPage = onlyPlatform(popularPage);
		model.addAttribute("popularPage", popularPage);
	}
	
	//플랫폼 외 n개를 작업해주는 메소드(재사용)
	private ArrayList<WebtoonCategoryDTO> onlyPlatform(ArrayList<WebtoonCategoryDTO> pageName) {
		for(int i=0;i<pageName.size();i++) {
			ArrayList<String> onlyPlatform = wvm.onlyPlatform(pageName.get(i).getWebtoonNum());
			int count  = onlyPlatform.size()-1;
			pageName.get(i).setPlatformName(onlyPlatform.get(0));
			pageName.get(i).setPlatformNum(count);//외 n으로 쓰임
		}return pageName;
	}

	@Override //플랫폼 ajax처리
	public ArrayList<WebtoonCategoryDTO> platformAjax(Model model, String platformName) {
		ArrayList<WebtoonCategoryDTO> platformAjax = wvm.platformView(platformName);
		return platformAjax;
	}

	@Override //장르 ajax처리
	public ArrayList<WebtoonCategoryDTO> genreAjax(Model model, String webtoonGenre) {
		ArrayList<WebtoonCategoryDTO> genreAjax = wvm.genreView(webtoonGenre);
		return genreAjax;
	}
}
