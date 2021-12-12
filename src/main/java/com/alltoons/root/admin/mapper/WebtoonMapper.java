package com.alltoons.root.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.alltoons.root.admin.dto.GenreDTO;
import com.alltoons.root.admin.dto.OriginDTO;
import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;

public interface WebtoonMapper {
	// public void upload(WebtoonDTO wd);

	public int uploadWetoon(WebtoonDTO wd);

	public WebtoonDTO selectNum(WebtoonDTO wd);

	public int uploadGenre(WebtoonDTO wd);

	// public int uploadPlatform(WebtoonDTO wd);

	public int uploadOriginal(OriginDTO od);

	public WebtoonDTO selectTitle(String webtoonTitle);

	public int uploadPlatform(PlatformDTO pd);

	public WebtoonDTO selectList(String webtoonNum);

	// public PlatformDTO selectLinks(String webtoonNum);

	public ArrayList<PlatformDTO> selectLinks(String webtoonNum);

	public int countPlatfrom(String webtoonNum);

	public OriginDTO selectOrigin(String webtoonNum);

	public GenreDTO selectGenre(String webtoonNum);

	public int modifyWebtoon(WebtoonDTO wd);

	public int modifyGerne(WebtoonDTO wd);

	public int modifyOrigin(WebtoonDTO wd);

	public int modifyPlatform(PlatformDTO pd);

	public void delLink(int webtoonNum);

	public ArrayList<OriginDTO> selectOriginLink(String webtoonNum);

	public void delOrigin(int webtoonNum);


}
