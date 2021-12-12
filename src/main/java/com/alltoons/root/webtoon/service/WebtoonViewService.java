package com.alltoons.root.webtoon.service;

import org.springframework.ui.Model;

import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;

public interface WebtoonViewService {

	void webtoonData(String webtoonNum, WebtoonViewDTO wvd, Model model);

}
