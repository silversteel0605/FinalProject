package com.spring.project.camping.mapper;


import java.util.List;

import com.spring.project.camping.DTO.CampingReviewDTO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.CampingSearchVO;

public interface CampingDataMapper {
	
	public int initData(CampingVO vo);
	
	public CampingVO[] getSearchData(CampingSearchVO vo);

	public int getSearchTotal(CampingSearchVO vo);
	
	public CampingVO getInfo(String contentId);
	
	public void addViews(String contentId);
	
	public int addData(CampingVO vo);

	public int updateData(CampingVO vo);
	
	public int deleteData(String contentId);
	
	//Review
	public List<CampingReviewDTO> getReviewAllInfoList(String contentId);	//All Reviews
	public CampingReviewDTO getReviewInfo(int reviewId);					//Review Data Select
	public void initReviewData(CampingReviewDTO c_dto);						//Review Data Insert
	public void reviewClickNumUp(int reviewId);								//ReviewClickNum Data Updata 
}
