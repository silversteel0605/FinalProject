package com.spring.project.camping.mapper;

import java.util.List;

import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.review.DTO.CampingReviewDTO;

public interface CampingDataMapper {
	
	public int initData(CampingVO vo);
	
	public CampingVO[] getSearchData(SearchVO vo);

	public int getSearchTotal(SearchVO vo);
	
	public CampingVO getInfo(String contentId);

	//Review
	public List<CampingReviewDTO> getReviewAllInfoList(String contentId);	//All Reviews
	public CampingReviewDTO getReviewInfo(int reviewId);					//Review Data Select
	public void initReviewData(CampingReviewDTO c_dto);						//Review Data Insert
	public void reviewClickNumUp(int reviewId);								//ReviewClickNum Data Updata
	public void reviewUpdate(CampingReviewDTO c_dto);						//ReviewData Updata
	public int getReviewAllPageCnt();										//Review Page Count Total
	public List<CampingReviewDTO> getReviewSearchData(SearchVO vo, int contentId); //Review Page Search Data (�̿�)
	//Review

	public void addViews(String contentId);

}
