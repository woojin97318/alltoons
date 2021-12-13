package com.alltoons.root.webtoon.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alltoons.root.webtoon.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonOriginDTO;
import com.alltoons.root.webtoon.dto.WebtoonPlatformDTO;
import com.alltoons.root.webtoon.dto.WebtoonViewDTO;

public interface WebtoonViewMapper {

	WebtoonViewDTO webtoonData(String webtoonNum);

	ArrayList<WebtoonPlatformDTO> platformList(String webtoonNum);

	ArrayList<WebtoonOriginDTO> originList(String webtoonNum);


	int intesrestCount(String webtoonNum);


	void interestClick(FavoritesDTO fd);

	public FavoritesDTO check(@Param("webtoonNum") String webtoonNum, @Param("userEmail") String userEmail);

	void insertInterest(@Param("webtoonNum") String webtoonNum, @Param("userEmail") String userEmail);

	char firestInterest(@Param("webtoonNum") String webtoonNum, @Param("userEmail") String userEmail);

	FavoritesDTO firestInterest(FavoritesDTO fd);

	void insertFavorties(String webtoonNum, String userEmail);

	void favoritesClick(FavoritesDTO fd);

	int favortiesCount(String webtoonNum);


}
