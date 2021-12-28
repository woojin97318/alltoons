package com.alltoons.root.webtoon.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.mapper.PagingMapper;
import com.alltoons.root.webtoon.paging.PagingVO;

@Service
public class PagingServiceImpl implements PagingService{

	@Autowired
	PagingMapper pagingMapper;
	
	@Override
	public int countWebtoon() {
		return pagingMapper.countWebtoon();
	}

	@Override
	public List<WebtoonViewDTO> selectWebtoons(PagingVO vo) {
		return pagingMapper.selectWebtoons(vo);
	}
	
}
