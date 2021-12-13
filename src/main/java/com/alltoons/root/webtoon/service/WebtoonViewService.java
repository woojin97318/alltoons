package com.alltoons.root.webtoon.service;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.webtoon.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;

public interface WebtoonViewService {

	void webtoonData(String webtoonNum, WebtoonViewDTO wvd, Model model);

	void favorites(String webtoonNum, FavoritesDTO fd, Model model);

	int interestClick(String webtoonNum, String userEmail);


	FavoritesDTO check(String webtoonNum, String userEmail, FavoritesDTO fd);

}
