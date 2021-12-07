package com.alltoons.root.admin.upload.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.upload.WebtoonMapper;
import com.alltoons.root.admin.upload.dto.WebtoonDTO;

@Service ("webtoonService")
public class WebtoonServiceImpl implements WebtoonService{
	@Autowired WebtoonMapper wm;

	@Override
	public void upload(MultipartHttpServletRequest mul, WebtoonDTO wd) {
		System.out.println(wd.getWebtoonTitle());
		imgUpload(mul,wd);
		wm.uploadWetoon(wd);
		wd.setWebtoonNum(wm.selectNum(wd).getWebtoonNum());
		wm.uploadGenre(wd);wm.uploadPlatform(wd);	wm.uploadOriginal(wd);
		
	}
	public void imgUpload(MultipartHttpServletRequest mul,WebtoonDTO wd) {
		MultipartFile file = mul.getFile("webtoon_Image");
		if(file.getSize() !=0) {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calender = Calendar.getInstance();
			String sysFileName = format.format(calender.getTime());
			sysFileName += file.getOriginalFilename();

			wd.setWebtoonImage(sysFileName);
			
			File saveImgFila = new File(WEBTOON_IMAGE+"/"+sysFileName);
			try {
				file.transferTo(saveImgFila);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			wd.setWebtoonImage("default_image");
		}
	}
}
