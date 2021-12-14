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

@Service
public class ModifyServiceImpl implements ModifyService{
	@Autowired WebtoonMapper wm;
	@Override
	public WebtoonDTO list(String webtoonNum,Model model) {
		WebtoonDTO wd = new WebtoonDTO();
		wd = wm.selectList(webtoonNum);//기본 webtoonDTO
		return wd;
	}
	@Override
	public ArrayList<GenreDTO> selectwebtoonGenre(String webtoonNum) {
		ArrayList<GenreDTO> webtoonGenre = wm.selectwebtoonGenre(webtoonNum);
		return webtoonGenre;
	}
	
	@Override
	public ArrayList<PlatformDTO> selectLinks(String webtoonNum) {
		ArrayList<PlatformDTO> list = wm.selectLinks(webtoonNum);
		return list;
	}
	@Override
	public ArrayList<OriginDTO> selectOriginLinks(String webtoonNum) {
		ArrayList<OriginDTO> originList = wm.selectOriginLink(webtoonNum);
		return originList;
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
			deleteImage(wd.getWebtoonNum());
			WebtoonServiceImpl.imgUpload(mul,wd);
		}
		
		result = wm.modifyWebtoon(wd);
		System.out.println("webtoon_info 처리: "+result);
		
		System.out.println(wd.getWebtoonGenre());
		//장르
		wm.delGenre(wd.getWebtoonNum());
		String webtoonGenre[] = mul.getParameterValues("webtoonGenre");
		GenreDTO gd= new GenreDTO();
		for(int i=0;i<webtoonGenre.length;i++) {
			gd.setWebtoonNum(wd.getWebtoonNum());
			gd.setWebtoonGenre(webtoonGenre[i]);
			result = wm.uploadGenre(gd);
		}System.out.println("gener 처리: "+result);
		
		//원작
		wm.delOrigin(wd.getWebtoonNum());
		OriginDTO od = new OriginDTO();
		if(mul.getParameter("originalPlatform")==null) {
			od.setWebtoonNum(wd.getWebtoonNum());
			od.setOriginalPlatform("nan");
			od.setWebtoonOriginalLink("nan");
			result = wm.uploadOriginal(od);
		}else {
			String origin_platform[] = mul.getParameterValues("originalPlatform");
			String origin_link[] = mul.getParameterValues("webtoonOriginalLink");
			
			for(int i=0;i<origin_platform.length;i++) {
				od.setWebtoonNum(wd.getWebtoonNum());
				od.setOriginalPlatform(origin_platform[i]);
				od.setWebtoonOriginalLink(origin_link[i]);
				result = wm.uploadOriginal(od);
			}
		}
		System.out.println("origin 처리: "+result);
		
		//링크
		wm.delLink(wd.getWebtoonNum());
		String platform[] = mul.getParameterValues("platformName");
		String link[] = mul.getParameterValues("webtoonLink");
		PlatformDTO pd = new PlatformDTO();
		for(int i=0;i<platform.length;i++) {
			pd.setWebtoonNum(wd.getWebtoonNum());
			pd.setPlatformName(platform[i]);
			pd.setWebtoonLink(link[i]);
			result = wm.uploadPlatform(pd);	
			//System.out.println(pd.getPlatformName() +" : "+pd.getWebtoonLink());
			//result = wm.modifyPlatform(pd);
			//System.out.println("플랫폼 처리"+i+": "+result);
		}
		return result;
	}
	private void deleteImage(int webtoonNum) {
		String originalImg = wm.selectList(Integer.toString(webtoonNum)).getWebtoonImage();
		File deleteImg = new File(WEBTOON_IMAGE+"/"+originalImg);
		System.out.println("이미지 삭제"+deleteImg.getName());
		deleteImg.delete();
	}
	
	
}
