package com.alltoons.root.admin.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;

public interface DeleteService {
	public void searchList(String search, Model model);

	public void deleteWebtoon(int webtoonNum);

	public void webtoonAllList(Model model);

	public String deleteImage(int webtoonNum, String webtoonImage);

	public ArrayList<WebtoonDTO> webtoonAllList(String start, String limit);
}
