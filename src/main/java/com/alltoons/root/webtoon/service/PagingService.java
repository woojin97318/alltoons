package com.alltoons.root.webtoon.service;

import java.util.List;

import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.paging.PagingVO;

public interface PagingService {
	public int countWebtoon();
	public List<WebtoonViewDTO> selectWebtoons(PagingVO vo);
}
