package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;
import com.alltoons.root.webtoon.mapper.WebtoonPageMapper;
@Service
public class WebtoonPageServiceImpl implements WebtoonPageService{
	@Autowired WebtoonPageMapper wpm;
	
	@Override
	public ArrayList<WebtoonCategoryDTO> sortNameAjax(String sort, String platformName, 
			String start, String limit) {
		System.out.println("start "+start);
		System.out.println("limit "+limit);
		System.out.println("sort "+sort);
		ArrayList<WebtoonCategoryDTO> platformAjax = null;
		if(sort.equals("popularity")) {
			platformAjax = wpm.platformPopularPage(platformName,start,limit);
		}else if(sort.equals("nameDesc")||sort.equals("nameAsc")||sort.equals("viewCount")) {
			System.out.println("이름순"+sort);
			platformAjax = wpm.sortNameAjax(platformName,sort,start,limit);
		}
		return platformAjax;
	}


	@Override
	public void platformView(Model model, String platformName, String start) {
		ArrayList<WebtoonCategoryDTO> platformView = wpm.platformView(platformName);
		model.addAttribute("platformView", platformView);
		
	}

}
