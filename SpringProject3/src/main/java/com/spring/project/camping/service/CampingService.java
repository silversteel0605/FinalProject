package com.spring.project.camping.service;

import java.io.IOException;
import java.util.List;

import org.jdom2.JDOMException;

import com.spring.project.camping.DTO.CampingReviewDTO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;

public interface CampingService {
	
	public void getSearchXML(String nowPage) throws  IOException, JDOMException;
	
	public void getAllXML() throws  IOException, JDOMException;
	
	public CampingVO[] getXMLData();

	public CampingVO[] getDbSearchData(SearchVO vo);
	
	public int initData(CampingVO vo);
	
	public int getTotal();
	
	public int getDbSearchTotal(SearchVO vo);
	
	public CampingVO getInfo(String contentId);
	
	public void addViews(String contentId);
	
	
	//Review
	public List<CampingReviewDTO> getReviewAllInfoList(String contentId);	//All Reviews
	public CampingReviewDTO getReviewInfo(int reviewId);					//Review Data Select
	public void initReviewData(CampingReviewDTO c_dto);						//Review Data Insert
	public void reviewClickNumUp(int reviewId);								//ReviewClickNum Data Updata
	
}
