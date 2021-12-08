package com.alltoons.root.admin.upload;

import com.alltoons.root.admin.upload.dto.WebtoonDTO;

public interface WebtoonMapper {
	//public void upload(WebtoonDTO wd);

	public int uploadWetoon(WebtoonDTO wd);

	public WebtoonDTO selectNum(WebtoonDTO wd);

	public int uploadGenre(WebtoonDTO wd);

	public int uploadPlatform(WebtoonDTO wd);

	public int uploadOriginal(WebtoonDTO wd);

	public WebtoonDTO selectTitle(String webtoonTitle);

}
