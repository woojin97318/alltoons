package com.alltoons.root.admin.service;

import java.io.File;
import java.util.ArrayList;

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
	}

	@Override
	public void deleteWebtoon(int webtoonNum) {
		int result = mapper.deleteWebtoon(webtoonNum);
		if(result==1) {
			System.out.println("bd 삭제 성공");
		}else {//result==0
			System.out.println("db 삭제 실패");
		}
	}

	@Override
	public void webtoonAllList(Model model) {
		ArrayList<WebtoonDTO> webtoonAllList = mapper.webtoonAllList(model);
		model.addAttribute("webtoonAllList",webtoonAllList);
	}

	@Override
	public String deleteImage(int webtoonNum, String webtoonImage) {
		File deleteImage = new File(IMAGE_REPO+"/"+webtoonImage);
		deleteImage.delete();
		String message = "파일 삭제 성공";
		return message;
	}
	
	
}
