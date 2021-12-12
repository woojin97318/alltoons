package com.alltoons.root.webtoon.mapper;

import java.util.ArrayList;

import com.alltoons.root.webtoon.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonOriginDTO;
import com.alltoons.root.webtoon.dto.WebtoonPlatformDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;

public interface WebtoonViewMapper {

	WebtoonViewDTO webtoonData(String webtoonNum);

	ArrayList<WebtoonPlatformDTO> platformList(String webtoonNum);

	ArrayList<WebtoonOriginDTO> originList(String webtoonNum);

	int favoritesCount(String webtoonNum);

	int intesrestCount(String webtoonNum);

}
