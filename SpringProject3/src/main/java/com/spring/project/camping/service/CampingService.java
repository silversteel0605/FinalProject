package com.spring.project.camping.service;

import java.io.IOException;
import java.util.List;

import org.jdom2.JDOMException;

import com.spring.project.camping.DTO.CampingReviewDTO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.CampingSearchVO;

public interface CampingService {
	
	public void getSearchXML(String nowPage) throws  IOException, JDOMException;
	
	public void getAllXML() throws  IOException, JDOMException;
	
	public CampingVO[] getXMLData();

	public CampingVO[] getDbSearchData(CampingSearchVO vo);
	
	public int initData(CampingVO vo);
	
	public int getTotal();
	
	public int getDbSearchTotal(CampingSearchVO vo);
	
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
