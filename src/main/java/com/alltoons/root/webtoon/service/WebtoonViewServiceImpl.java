package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.mapper.WebtoonMapper;
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
		/*for(int i=0;i<platformList.size();i++) {
			System.out.println(platformList.get(i).getPlatformName());
		}*/
		model.addAttribute("platformList",platformList);
		
	}
	
	
	
}
