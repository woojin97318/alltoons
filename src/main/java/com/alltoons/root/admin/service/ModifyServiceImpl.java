package com.alltoons.root.admin.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

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

@Service("modifyService")
public class ModifyServiceImpl implements ModifyService{
	@Autowired WebtoonMapper wm;
	@Override
	public WebtoonDTO list(String webtoonNum,Model model) {
		WebtoonDTO wd = new WebtoonDTO();
		wd = wm.selectList(webtoonNum);//기본 webtoonDTO
		GenreDTO gd =wm.selectGenre(webtoonNum);//장르 입력
		wd.setWebtoonGenre(gd.getWebtoonGenre());
		
		OriginDTO od = wm.selectOrigin(webtoonNum);//원작 입력
		wd.setOriginalPlatform(od.getOriginalPlatform());
		wd.setWebtoonOriginalLink(od.getWebtoonOriginalLink());
		model.addAttribute("countLink",wm.countPlatfrom(webtoonNum));
		return wd;
	}
	@Override
	public ArrayList<PlatformDTO> selectLinks(String webtoonNum) {
		ArrayList<PlatformDTO> list = wm.selectLinks(webtoonNum);
		return list;
	}
	@Override
	public int modify(MultipartHttpServletRequest mul, WebtoonDTO wd) {
		int result =0;
		//이미지 처리
		if(mul.getFile("webtoon_Image").getSize() ==0) {
			System.out.println("기존 이미지를 유지");
			String img = wm.selectList(Integer.toString(wd.getWebtoonNum())).getWebtoonImage();
			if(img.equals("default_image")) {
				wd.setWebtoonImage("default_image");
			}else {
				wd.setWebtoonImage(img);
			}
			
		}else {
			System.out.println("이미지 변경");
			WebtoonServiceImpl.imgUpload(mul,wd);
		}
		
		result = wm.modifyWebtoon(wd);
		System.out.println("webtoon_info 처리: "+result);
		
		System.out.println(wd.getWebtoonGenre());
		result = wm.modifyGerne(wd);
		System.out.println("gener 처리: "+result);
		result = wm.modifyOrigin(wd);
		System.out.println("origin 처리: "+result);
		String platform[] = mul.getParameterValues("platformName");
		String link[] = mul.getParameterValues("webtoonLink");
		PlatformDTO pd = new PlatformDTO();
		for(int i=0;i<platform.length;i++) {
			pd.setWebtoonNum(wd.getWebtoonNum());
			pd.setPlatformName(platform[i]);
			pd.setWebtoonLink(link[i]);
			//System.out.println(pd.getPlatformName() +" : "+pd.getWebtoonLink());
			result = wm.modifyPlatform(pd);
			System.out.println("플랫폼 처리"+i+": "+result);
		}
		return result;
	}
}
