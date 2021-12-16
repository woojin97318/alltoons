package com.alltoons.root.webtoon.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.favorites.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;

public interface WebtoonViewService {

	void webtoonData(String webtoonNum, WebtoonViewDTO wvd, Model model);

	void favorites(String webtoonNum, FavoritesDTO fd, Model model, HttpSession session);

	int interestClick(String webtoonNum, String userEmail);
	int favoritesClick(String webtoonNum, String userEmail);

	FavoritesDTO onOff(FavoritesDTO fd, String webtoonNum, String userEmail);

	void platformView(Model model, String platformName);

	void genreView(Model model, String webtoonGenre);

	void favortiesPage(Model model, String userEmail);

	void interestPage(Model model, String userEmail);

	public void popularWebtoon(Model model);

}
