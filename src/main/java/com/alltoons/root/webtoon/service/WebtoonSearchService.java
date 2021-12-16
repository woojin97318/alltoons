package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;

public interface WebtoonSearchService {

	public void searchList(String search, Model model);
	
	public String getplatformName(int webtoonNum);
	
	public void setArr(ArrayList<WebtoonDTO> arr, Model model, String name);
}
