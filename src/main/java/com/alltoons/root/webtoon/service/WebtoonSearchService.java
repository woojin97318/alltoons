package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;

public interface WebtoonSearchService {

	public ArrayList<WebtoonDTO> searchList(String search, Model model, String view);
	
	public ArrayList<WebtoonDTO> getPlatformResult(ArrayList<WebtoonDTO> arr,
			Model model, String name);
	public String getplatformAll(int webtoonNum);
	
	public void setModel(ArrayList<WebtoonDTO> arr, Model model, String name);
	
	public String getplatFirst(int webtoonNum);
	
}
