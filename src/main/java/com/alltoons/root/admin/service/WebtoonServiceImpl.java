package com.alltoons.root.admin.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alltoons.root.admin.dto.GenreDTO;
import com.alltoons.root.admin.dto.OriginDTO;
import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.mapper.WebtoonMapper;


@Service 
public class WebtoonServiceImpl implements WebtoonService{
	@Autowired WebtoonMapper wm;

	@Override
	public int upload(MultipartHttpServletRequest mul, WebtoonDTO wd) {
		int result = 0;
		System.out.println(wd.getWebtoonTitle());
		imgUpload(mul,wd);
		result = wm.uploadWetoon(wd);
		wd.setWebtoonNum(wm.selectNum(wd).getWebtoonNum());
		//result = wm.uploadGenre(wd);
		//장르
		String webtoonGenre[] = mul.getParameterValues("webtoonGenre");
		GenreDTO gd = new GenreDTO();
		for(int i=0;i<webtoonGenre.length;i++) {
			gd.setWebtoonNum(wd.webtoonNum);
			gd.setWebtoonGenre(webtoonGenre[i]);
			result = wm.uploadGenre(gd);	
		}
		
		//result = wm.uploadOriginal(wd);
		//원작
		String origin_platform[] = mul.getParameterValues("originalPlatform");
		String origin_link[] = mul.getParameterValues("webtoonOriginalLink");
		OriginDTO od = new OriginDTO();
		for(int i=0;i<origin_platform.length;i++) {
			if(origin_platform[0].equals("nan")) {
				System.out.println("원작 없음");
				od.setWebtoonNum(wd.webtoonNum);
				od.setOriginalPlatform("nan");
				od.setWebtoonOriginalLink("nan");
			}else {
			od.setWebtoonNum(wd.getWebtoonNum());
			od.setOriginalPlatform(origin_platform[i]);
			od.setWebtoonOriginalLink(origin_link[i]);
			}result = wm.uploadOriginal(od);
		}
		//웹툰
		String platform[] = mul.getParameterValues("platformName");
		String link[] = mul.getParameterValues("webtoonLink");
		PlatformDTO pd = new PlatformDTO();
		for(int i=0;i<platform.length;i++) {
			pd.setWebtoonNum(wd.getWebtoonNum());
			pd.setPlatformName(platform[i]);
			pd.setWebtoonLink(link[i]);
			result = wm.uploadPlatform(pd);	
		}
		
		//result = wm.uploadPlatform(wd);	
		
		return result;
	}
	public static void imgUpload(MultipartHttpServletRequest mul,WebtoonDTO wd) {
		MultipartFile file = mul.getFile("webtoon_Image");
		if(file.getSize() !=0) {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calender = Calendar.getInstance();
			String sysFileName = format.format(calender.getTime());
			sysFileName += file.getOriginalFilename();

			wd.setWebtoonImage(sysFileName);
			
			File saveImgFila = new File(ModifyService.WEBTOON_IMAGE+"/"+sysFileName);
			try {
				file.transferTo(saveImgFila);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			wd.setWebtoonImage("default_image.png");
		}
	}

	
}
