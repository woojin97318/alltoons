package com.alltoons.root.admin.mapper;

import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;

public interface WebtoonMapper {
	//public void upload(WebtoonDTO wd);

	public int uploadWetoon(WebtoonDTO wd);

	public WebtoonDTO selectNum(WebtoonDTO wd);

	public int uploadGenre(WebtoonDTO wd);

	//public int uploadPlatform(WebtoonDTO wd);

	public int uploadOriginal(WebtoonDTO wd);

	public WebtoonDTO selectTitle(String webtoonTitle);

	public int uploadPlatform(PlatformDTO pd);

}
