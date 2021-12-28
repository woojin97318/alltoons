package com.alltoons.root.webtoon.mapper;

import java.util.List;

import com.alltoons.root.webtoon.dto.WebtoonViewDTO;
import com.alltoons.root.webtoon.paging.PagingVO;

public interface PagingMapper {
public int countWebtoon();
public List<WebtoonViewDTO> selectWebtoons(PagingVO vo);
}
