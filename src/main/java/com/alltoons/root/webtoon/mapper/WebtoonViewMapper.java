package com.alltoons.root.webtoon.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alltoons.root.favorites.dto.FavoritesDTO;
import com.alltoons.root.webtoon.dto.WebtoonCategoryDTO;
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

	void insertFavorties(@Param("webtoonNum") String webtoonNum, @Param("userEmail") String userEmail);

	void favoritesClick(FavoritesDTO fd);

	int favortiesCount(String webtoonNum);

	int linkCount(String webtoonNum);

	ArrayList<WebtoonCategoryDTO> platformView(String platformName);

	ArrayList<WebtoonCategoryDTO> genreView(String webtoonGenre);

	ArrayList<WebtoonCategoryDTO> favortiesPage(String userEmail);

	int platformCount(@Param("userEmail") String userEmail,@Param("webtoonNum") int webtoonNum);

	ArrayList<String> onlyPlatform(int webtoonNum);



}
