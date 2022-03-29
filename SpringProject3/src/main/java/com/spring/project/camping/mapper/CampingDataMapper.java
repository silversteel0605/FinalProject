package com.spring.project.camping.mapper;

import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;

public interface CampingDataMapper {
	
	public int initData(CampingVO vo);
	
	public CampingVO[] getSearchData(SearchVO vo);

	public int getSearchTotal(SearchVO vo);
	
	public CampingVO getInfo(String contentId);

	public int addData(CampingVO vo);

	public int updateData(CampingVO vo);
	
	public int deleteData(String contentId);

	public void addViews(String contentId);

}
