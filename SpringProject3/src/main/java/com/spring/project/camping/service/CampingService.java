package com.spring.project.camping.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import java.util.Map;

import org.jdom2.JDOMException;

import com.spring.project.camping.DTO.CampingImgVO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.review.DTO.CampingReviewDTO;

public interface CampingService {
	
	public void getSearchXML(String nowPage) throws  IOException, JDOMException;
	
	public void getAllXML() throws  IOException, JDOMException;
	
	public CampingVO[] getXMLData();

	public CampingVO[] getDbSearchData(SearchVO vo);
	
	public int initData(CampingVO vo);
	
	public int getTotal();
	
	public int getDbSearchTotal(SearchVO vo);
	
	public CampingVO getInfo(String contentId);
	
	//Img Data
	public List<CampingImgVO> getCampingImgXML(String contentId) throws IOException, JDOMException;
	//Img Data

	//Review
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
	//Review
	
	public void addViews(String contentId);

	
}
