package com.alltoons.root.admin.upload.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alltoons.root.admin.upload.WebtoonMapper;
import com.alltoons.root.admin.upload.dto.WebtoonDTO;

@Service ("webtoonService")
public class WebtoonServiceImpl implements WebtoonService{
	@Autowired WebtoonMapper wm;

	@Override
	public void upload(WebtoonDTO wd) {
		wm.uploadWetoon(wd);
		wd.setWebtoonNum(wm.selectNum(wd).getWebtoonNum());
		wm.uploadGenre(wd);wm.uploadPlatform(wd);	wm.uploadOriginal(wd);
		
	}
	
}
