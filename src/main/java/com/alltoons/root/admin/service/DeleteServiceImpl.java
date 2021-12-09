package com.alltoons.root.admin.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.mapper.DeleteMapper;

@Service("deleteService")
public class DeleteServiceImpl implements DeleteService{
	@Autowired DeleteMapper mapper;
	WebtoonDTO dto;

	@Override
	public void searchList(String search, Model model) {
		System.out.println(search);
		//WebtoonDTO writerList = mapper.writerList(search); 하나의 결과값만 가져옴
		ArrayList<WebtoonDTO> writerList = mapper.writerList(search);
		ArrayList<WebtoonDTO> titleList = mapper.titleList(search);
		
		model.addAttribute("search", search);
		
		if(titleList.size()!=0) {
			model.addAttribute("titleList",titleList);
		}
		if(writerList.size()!=0) {
			model.addAttribute("writerList",writerList);
		}
		/*
		if(titleList.size()!=0 && writerList.size()!=0) {
			System.out.println(titleList.get(0));
		
			System.out.println(writerList.get(0).getWebtoonNum());
		}else {
			System.out.println("값이 없음");
		}*/
	}

	@Override
	public void deleteWebtoon(int webtoonNum) {
		int result = mapper.deleteWebtoon(webtoonNum);
		if(result==1) {
			System.out.println("성공했습니다.");
			
		}else {//result==0
			System.out.println("실패했습니다.");
		}
	}

	@Override
	public void webtoonAllList(Model model) {
		ArrayList<WebtoonDTO> webtoonAllList = mapper.webtoonAllList(model);
		model.addAttribute("webtoonAllList",webtoonAllList);
	}
	
	
}
