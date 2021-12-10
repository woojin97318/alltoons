package com.alltoons.root.admin.service;

import org.springframework.ui.Model;

public interface DeleteService {
	public static final String IMAGE_REPO = "C:/alltoonsImage";
	public void searchList(String search, Model model);

	public void deleteWebtoon(int webtoonNum);

	public void webtoonAllList(Model model);

	public String deleteImage(int webtoonNum, String webtoonImage);
}
