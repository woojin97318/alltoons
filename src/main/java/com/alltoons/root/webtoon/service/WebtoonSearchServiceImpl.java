package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.webtoon.dto.WebtoonPlatformKor;
import com.alltoons.root.webtoon.mapper.WebtoonSearchMapper;

@Service
public class WebtoonSearchServiceImpl implements WebtoonSearchService{
	
	@Autowired WebtoonSearchMapper mapper;
	WebtoonDTO dto;
	WebtoonPlatformKor kor = new WebtoonPlatformKor();
	
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
	
	public void setArr(ArrayList<WebtoonDTO> arr,
						Model model, 
						String name) {//검색 결과 list에 플랫폼 값도 추가
		int webtoonNum; 
		String platFirst;
		int platCnt;
		String platform; //플랫폼 result
		if(arr.size()!=0) {
			for(int i=0; i<arr.size(); i++ ) {
				webtoonNum = arr.get(i).getWebtoonNum();
				System.out.println("webtoonNum: "+webtoonNum);
				platFirst = getplatFirst(webtoonNum);
				
				if(platFirst == null) {
					platform = "없음";
				}else {
					platform = platFirst;
					platCnt = platCnt(webtoonNum);
					if(platCnt>=2) {
						platform += " 외 " + (platCnt-1)+"곳";//플랫폼 외 n곳
					}
				}System.out.println(platform);
				//platform = getplatformAll(webtoonNum); //플랫폼1/플랫폼2/플랫폼3...
				
				 arr.get(i).platformName = platform;
			}
			model.addAttribute(name, arr); //제목별 검색 arr
		}
	}
	
	public String getplatformAll(int webtoonNum) {//플랫폼 이름들
			String platformList = mapper.getplatformAll(webtoonNum);
			return platformList;// 플랫폼1/플랫폼2/플랫폼3...
	}
	
	@Override
	public String getplatFirst(int webtoonNum) {//첫번째 플랫폼 값만 가져옴, 한글이름
		String platFirst = mapper.getplatFirst(webtoonNum);
		System.out.println(platFirst);
		if(platFirst.equals("kakaoWebtoon")) {
			platFirst = kor.getKakaoWebtoon();
		}else if (platFirst.equals("ridibooks")) {
			platFirst = kor.getRidibooks();
		}else if (platFirst.equals("naver")) {
			platFirst = kor.getNaver();
		}else if (platFirst.equals("naverSeries")) {
			platFirst = kor.getNaverSeries();
		}else if (platFirst.equals("kakaoPage")) {
			platFirst = kor.getKakaoPage();
		}else if (platFirst.equals("lezhin")) {
			platFirst = kor.getLezhin();
		}else if (platFirst.equals("toptoon")) {
			platFirst = kor.getToptoon();
		}else if (platFirst.equals("mrblue")) {
			platFirst = kor.getMrblue();
		}else if (platFirst.equals("munpia")) {
			platFirst = kor.getMunpia();
		}else {
			platFirst = "없음";
		}
		return platFirst;
	}
	
	public int platCnt(int webtoonNum) {//플랫폼 수
		int platCnt = mapper.platCnt(webtoonNum);
		return platCnt;
	};
}
