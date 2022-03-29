package com.spring.project.camping.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom2.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.camping.DTO.CampingImgVO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.camping.service.CampingService;
import com.spring.project.review.DTO.CampingReviewDTO;
import com.spring.project.review.service.CampingReviewService;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CampingController {
	
	@Autowired
	CampingService service;
	
	/*
	@Autowired
	CampingReviewService reviewService = null;
	*/
	private static int cntPerPage = 9;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model m, @RequestParam(value="nowPage", required=false)String nowPage, SearchVO vo)  throws  IOException, JDOMException {
		controlling(m, nowPage, vo);
		return "search";
	}
	
	//rest로 태그 검색하기  ※지금 안씀
	@RequestMapping(value = "/search2", method = RequestMethod.GET)
	public String search2(Model m, SearchVO vo, @RequestParam(value="nowPage", required=false)String nowPage)  throws  IOException, JDOMException {
		log.info(vo);
		nowPage = nowPage != null ? nowPage :"1";
		vo.setTagUri();
		m.addAttribute("tags", vo);
		m.addAttribute("nowPage", nowPage);
		return "rest_search";
	}
	
	@RequestMapping(value = "/TempCampInfo", method = RequestMethod.GET)
	public String info(
			Model m, 
			@RequestParam(value="contentId") String contentId, 
			@RequestParam(value="nowPage", required=false)String nowPage, 
			SearchVO vo, 
			@RequestParam(value="type", required=false)String type, 
			@RequestParam(value="value", required=false)String value
		) throws IOException, JDOMException {
		
		log.info("value : " + value);
		
		List<CampingImgVO> img_vo = service.getCampingImgXML(contentId);
		
		log.info("img_vo : " + img_vo);
		
		service.addViews(contentId);
		CampingVO info = service.getInfo(contentId);

		type = type != null ? type :"1";
		
		log.info(type);
		
		m.addAttribute("info", info);
		m.addAttribute("type", type);
		m.addAttribute("img_vo", img_vo);
		
		//reviewControlling(m, nowPage, contentId, vo, value);
		
		return "camping_index";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Model m, @RequestParam(value="nowPage", required=false)String nowPage, SearchVO vo) {
		controlling(m, nowPage, vo);
		return "map-search";
	}
	
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String init() {
		return "init";
	}
	
	public void controlling(Model m, @RequestParam(value="nowPage", required=false)String nowPage, SearchVO vo) {
		CampingVO[] ar;
		PagingVO pvo;
		int total;
		String searchTy;
		
		nowPage = nowPage != null ? nowPage :"1";
		
		searchTy = vo.getSearchTy();
		total = service.getDbSearchTotal(vo);
		pvo = new PagingVO(total, Integer.parseInt(nowPage), cntPerPage);
		log.info(pvo.getCntPerPage());
		vo.calcStartEnd(Integer.parseInt(nowPage), pvo.getCntPerPage());
		log.info(vo.getStart());
		log.info(vo.getEnd());
		if (searchTy != null) {
			if (searchTy.equals("condition")) {
				vo.setConditionUri();
			} else {
				vo.setTagUri();
			}
		}
		
		vo.setOrderUri();
		log.info(vo.getUri());
		ar = service.getDbSearchData(vo);
		
		m.addAttribute("search", vo);
		m.addAttribute("paging", pvo);
		m.addAttribute("lists", ar);
	}
	
	
	
}
