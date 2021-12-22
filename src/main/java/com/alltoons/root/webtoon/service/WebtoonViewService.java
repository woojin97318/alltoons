package com.alltoons.root.webtoon.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.favorites.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;

public interface WebtoonViewService {

	public void webtoonData(String webtoonNum, WebtoonViewDTO wvd, Model model);

	public void favorites(String webtoonNum, FavoritesDTO fd, Model model, HttpSession session);

	public int interestClick(String webtoonNum, String userEmail);

	public int favoritesClick(String webtoonNum, String userEmail);

	public FavoritesDTO onOff(FavoritesDTO fd, String webtoonNum, String userEmail);

	public void platformView(Model model, String platformName);

	public void genreView(Model model, String webtoonGenre);

	public void favortiesPage(Model model, String userEmail);

	public void interestPage(Model model, String userEmail);

	public void popularWebtoon(Model model);

	//public ArrayList<WebtoonCategoryDTO> platformAjax(Model model, String platformName);

	//public ArrayList<WebtoonCategoryDTO> genreAjax(Model model, String webtoonGenre);

	public ArrayList<WebtoonCategoryDTO> sortNameAjax(String sort, String platformName);

	public ArrayList<WebtoonCategoryDTO> genreSortAjax(String sort, String webtoonGenre);

}
