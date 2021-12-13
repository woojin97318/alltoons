package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.mapper.WebtoonMapper;
import com.alltoons.root.webtoon.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonOriginDTO;
import com.alltoons.root.webtoon.dto.WebtoonPlatformDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.mapper.WebtoonViewMapper;

@Service("webtoonViewService")
public class WebtoonViewServiceImpl implements WebtoonViewService{
	@Autowired WebtoonViewMapper wvm;

	@Override
	public void webtoonData(String webtoonNum, WebtoonViewDTO wvd, Model model) {
		wvd = wvm.webtoonData(webtoonNum);
		model.addAttribute("webtoonDate",wvd);
		
		ArrayList<WebtoonPlatformDTO> platformList = wvm.platformList(webtoonNum);
		model.addAttribute("platformList",platformList);
		
		ArrayList<WebtoonOriginDTO> originList = wvm.originList(webtoonNum);
		model.addAttribute("originList",originList);
	}

	@Override
	public void favorites(String webtoonNum, FavoritesDTO fd, Model model) {
		//수정중
		int favoritesCount = wvm.favoritesCount(webtoonNum);
		int intesrestCount = wvm.intesrestCount(webtoonNum);
		model.addAttribute("favoritesCount",favoritesCount);
		model.addAttribute("intesrestCount",intesrestCount);
	}

	@Override
	public int interestClick(String webtoonNum, String userEmail) {
		System.out.println("서비스 도착");
		FavoritesDTO fd = wvm.check(webtoonNum,userEmail);//여기서 오류
		if(fd==null) {wvm.insertInterest(webtoonNum,userEmail);}
		System.out.println(fd.getFavofites());
		System.out.println(fd.getWebtoonNum());
		if(fd.getInterest()=='T') {
			fd.setInterest('F');
		}else {
			fd.setInterest('T');
		}
		wvm.interestClick(fd);
		int intesrestCount = wvm.intesrestCount(webtoonNum);
		System.out.println(intesrestCount);
		return intesrestCount;
	}

	@Override
	public FavoritesDTO check(String webtoonNum, String userEmail, FavoritesDTO fd) {
		fd = wvm.check(webtoonNum,userEmail);
		return fd;
	}
	
	
	
}
