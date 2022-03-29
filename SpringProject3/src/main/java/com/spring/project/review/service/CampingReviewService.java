package com.spring.project.review.service;

import java.util.List;
import java.util.Map;

import com.spring.project.review.DTO.CampingReviewDTO;

public interface CampingReviewService {

	public List<CampingReviewDTO> getReviewAllInfoList(String contentId);	//All Reviews
	
	public CampingReviewDTO getReviewInfo(int reviewId);					//Review Data Select
	
	public void initReviewData(CampingReviewDTO c_dto);						//Review Data Insert
	
	public void reviewClickNumUp(int reviewId);								//ReviewClickNum Data Updata
	
	public void reviewUpdate(CampingReviewDTO c_dto);						//ReviewData Updata
	
	public int getReviewAllPageCnt();										//Review Page Count Total
	
	public List<CampingReviewDTO> getReviewSearchData(Map<String, Object> reviewMap); //Review Page Search Data (¹Ì¿Ï)
	
	public int getReviewCreateReviewID();									//db last seq id select
	
	public void deleteReviewData(int reviewId);								//Review Data Delete
	
	public List<CampingReviewDTO> getSortReviewDatas(Map<String, Object> reviewMap); //Review Sort Data
	
}
