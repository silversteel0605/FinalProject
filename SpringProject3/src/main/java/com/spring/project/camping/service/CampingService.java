package com.spring.project.camping.service;

import java.io.IOException;
import java.util.List;

import org.jdom2.JDOMException;

import com.spring.project.camping.DTO.CampingImgVO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;

public interface CampingService {
	
	public void getSearchXML(String nowPage) throws  IOException, JDOMException;
	
	public void getAllXML() throws  IOException, JDOMException;
	
	public CampingVO[] getXMLData();
	
	public void getTest();

	public CampingVO[] getDbSearchData(SearchVO vo);
	
	public int initData(CampingVO vo);
	
	public int getTotal();
	
	public int getDbSearchTotal(SearchVO vo);
	
	public CampingVO getInfo(String contentId);
	
	public int addData(CampingVO vo);
	
	public int updateData(CampingVO vo);
	
	public int deleteData(String contentId);
	
	//Img Data
	public List<CampingImgVO> getCampingImgXML(String contentId) throws IOException, JDOMException;
	//Img Data

	public void addViews(String contentId);

	
}
