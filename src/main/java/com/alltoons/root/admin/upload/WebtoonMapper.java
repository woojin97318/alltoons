package com.alltoons.root.admin.upload;

import com.alltoons.root.admin.upload.dto.WebtoonDTO;

public interface WebtoonMapper {
	//public void upload(WebtoonDTO wd);

	public void uploadWetoon(WebtoonDTO wd);

	public WebtoonDTO selectNum(WebtoonDTO wd);

	public void uploadGenre(WebtoonDTO wd);

	public void uploadPlatform(WebtoonDTO wd);

	public void uploadOriginal(WebtoonDTO wd);

}
