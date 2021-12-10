package com.alltoons.root.admin.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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
}
