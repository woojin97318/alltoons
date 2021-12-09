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

import com.alltoons.root.admin.dto.OriginDTO;
import com.alltoons.root.admin.dto.PlatformDTO;
import com.alltoons.root.admin.dto.WebtoonDTO;
import com.alltoons.root.admin.mapper.WebtoonMapper;


@Service ("webtoonService")
public class WebtoonServiceImpl implements WebtoonService{
	@Autowired WebtoonMapper wm;

	@Override
	public int upload(MultipartHttpServletRequest mul, WebtoonDTO wd) {
		int result = 0;
		System.out.println(wd.getWebtoonTitle());
		imgUpload(mul,wd);
		result = wm.uploadWetoon(wd);
		wd.setWebtoonNum(wm.selectNum(wd).getWebtoonNum());
		result = wm.uploadGenre(wd);
		result = wm.uploadOriginal(wd);
		
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
	@Override
	public WebtoonDTO list(String webtoonNum) {
		WebtoonDTO wd = new WebtoonDTO();
		OriginDTO od = new OriginDTO();
		wd = wm.selectList(webtoonNum);
		od = wm.selectOrigin(webtoonNum);
		wd.setOriginalPlatform(od.getOriginalPlatform());
		wd.setWebtoonOriginalLink(wd.getWebtoonOriginalLink());
		return wd;
	}
	@Override
	public ArrayList<PlatformDTO> selectLinks(String webtoonNum) {
		ArrayList<PlatformDTO> list = wm.selectLinks(webtoonNum);
		return list;
	}
	
}
