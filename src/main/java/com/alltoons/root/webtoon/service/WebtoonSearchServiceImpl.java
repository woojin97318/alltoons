package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.webtoon.mapper.WebtoonSearchMapper;

@Service
public class WebtoonSearchServiceImpl implements WebtoonSearchService{
	
	@Autowired WebtoonSearchMapper mapper;
	WebtoonDTO dto;
	
	@Override
	public void searchList(String search, Model model) {
		ArrayList<WebtoonDTO> titleList = mapper.titleList(search); //제목별 검색
		ArrayList<WebtoonDTO> writerList = mapper.writerList(search); //작가명 검색
		
		if(titleList.size()!=0) {
			setArr(titleList, model, "titleList"); //플랫폼 추가 및 모델 추가
		}
		if(writerList.size()!=0) {
			setArr(writerList, model, "writerList"); //플랫폼 추가 및 모델 추가
		}
	}
	
	public String getplatformName(int webtoonNum) {//플랫폼 이름들
		String platformList = mapper.getplatformName(webtoonNum);
		return platformList;// 플랫폼1/플랫폼2/플랫폼3...
	}
	
	public void setArr(ArrayList<WebtoonDTO> arr,
						Model model, 
						String name) {
		int webtoonNum;
		String platformList; //result 형태 : 플랫폼1/플랫폼2/플랫폼3
		
		if(arr.size()!=0) {
			for(int i=0; i<arr.size(); i++ ) {
				webtoonNum = arr.get(i).getWebtoonNum();
				System.out.println("num: "+webtoonNum);
				platformList = getplatformName(webtoonNum);
				if(platformList == null) {
					platformList = "없음";
				}
				 arr.get(i).platformName = platformList;
			}
			model.addAttribute(name, arr); //제목별 검색 arr
		}
	}
}
