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
	public ArrayList<WebtoonDTO> searchList(String search, Model model, String view) {//모델에 들어있는 특정 값 가져오기
		ArrayList<WebtoonDTO> webtoonList = new ArrayList<WebtoonDTO>();
		if(view.equals("titleList")) {
			webtoonList = mapper.titleList(search);	//제목별 검색
		}else if(view.equals("writerList")) {
			webtoonList = mapper.writerList(search);//작가명 검색
		}
		if(webtoonList.size()!=0) {
			webtoonList = getPlatformResult(webtoonList, model, view);
			setModel(webtoonList, model, view);
		}
		return webtoonList;
	}
	@Override
	public ArrayList<WebtoonDTO> getPlatformResult(ArrayList<WebtoonDTO> arr,
											Model model, String name){
		int webtoonNum; 
		String platFirst;
		int platCnt;
		String platform;//플랫폼 결과값
		
		if(arr.size()!=0) {
			for(int i=0; i<arr.size(); i++ ) {//플랫폼 값 arr에 추가
				webtoonNum = arr.get(i).getWebtoonNum(); //웹툰식별번호
				System.out.println("webtoonNum: "+webtoonNum);
				platFirst = getplatFirst(webtoonNum); //첫번째 플랫폼

				if(platFirst.equals("없음")) {
					platform = "정보 없음";
				}else {
					platform = platFirst;
					platCnt = platCnt(webtoonNum); //플랫폼 수
					if(platCnt>=2) {
						platform += " 외 " + (platCnt-1)+"곳"; //플랫폼1 외 n-1곳
					}
					System.out.println("플랫폼: "+platform);
					System.out.println("플랫폼 수: "+platCnt);
					//platform = getplatformAll(webtoonNum); //플랫폼1/플랫폼2/플랫폼3...
				}
				arr.get(i).platformName = platform; //검색 결과에 플랫폼 값도 추가
			}
		}return arr;
	}
		
	public void setModel(ArrayList<WebtoonDTO> arr,
						Model model, String name) {
		model.addAttribute(name, arr);
	}
	
	public String getplatformAll(int webtoonNum) {//플랫폼 이름들
			String platformList = mapper.getplatformAll(webtoonNum);
			return platformList;// 플랫폼1/플랫폼2/플랫폼3...
	}
	
	@Override
	public String getplatFirst(int webtoonNum) {//첫번째 플랫폼 값만 가져옴, 한글이름
		String platFirst;
		platFirst = mapper.getplatFirst(webtoonNum);
		
		if(platFirst != null) {
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
			}
		}else{
			platFirst = "없음";
		}
		System.out.println("getplatFirst: "+platFirst);
		return platFirst;
	}
	
	public int platCnt(int webtoonNum) {//플랫폼 수
		int platCnt = mapper.platCnt(webtoonNum);
		return platCnt;
	}

	

	
}
