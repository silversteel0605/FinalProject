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
import com.spring.project.review.controller.CampingReviewController;
import com.spring.project.review.service.CampingReviewService;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CampingController {
	
	@Autowired
	CampingService service;
	
	@Autowired
	CampingReviewService reviewService = null;
	
	CampingReviewController crc = null;

	private static int cntPerPage = 10;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model m, @RequestParam(value="nowPage", required=false)String nowPage, SearchVO vo)  throws  IOException, JDOMException {
		controlling(m, nowPage, vo);
		return "search";
	}



	
	@RequestMapping(value = "/CampInfo", method = RequestMethod.GET)
	public String info(
			Model m, 
			@RequestParam(value="contentId") String contentId, 
			@RequestParam(value="nowPage", required=false)String nowPage, 
			SearchVO vo, 
			@RequestParam(value="type", required=false)String type, 
			@RequestParam(value="value", required=false)String value
		) throws IOException, JDOMException {
		
		log.info("value : " + value);
		
		//service.getTest();
		
		List<CampingImgVO> img_vo = service.getCampingImgXML(contentId);
		
		log.info("img_vo : " + img_vo);
		
		service.addViews(contentId);
		CampingVO info = service.getInfo(contentId);

		type = type != null ? type :"1";
		
		log.info(type);
		
		m.addAttribute("info", info);
		m.addAttribute("type", type);
		m.addAttribute("img_vo", img_vo);
		
		reviewControlling(m, nowPage, contentId, vo, value);
		
		return "camping_index";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Model m, @RequestParam(value="nowPage", required=false)String nowPage, SearchVO vo) {
		controlling(m, nowPage, vo);
		return "map";
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
		vo.calcStartEnd(Integer.parseInt(nowPage), pvo.getCntPerPage());
		if (searchTy != null) {
			if (searchTy.equals("condition")) {
				vo.setConditionUri();
			} else {
				vo.setTagUri();
			}
		}
		vo.setOrderUri();
		ar = service.getDbSearchData(vo);
		
		log.info(vo);
		m.addAttribute("search", vo);
		m.addAttribute("paging", pvo);
		m.addAttribute("lists", ar);
	}
	
	public void reviewControlling(
			Model m, 
			@RequestParam(value="nowPage", required=false)String nowPage, 
			@RequestParam(value="contentId") String contentId, 
			SearchVO vo,
			String value
		) {
		
		int reviewTotal;
		List<CampingReviewDTO> reviews;
		PagingVO pvo;
		Map<String, Object> reviewMap = new HashMap();
		
		reviewTotal = reviewService.getReviewAllPageCnt();
		
		String searchTy;
		
		nowPage = nowPage != null ? nowPage :"1";
		
		searchTy = vo.getSearchTy();
		
		pvo = new PagingVO(reviewTotal, Integer.parseInt(nowPage), cntPerPage);
		vo.calcStartEnd(Integer.parseInt(nowPage), pvo.getCntPerPage());
		log.info("vo.getStart() " + vo.getStart());
		log.info("vo.getEnd() " +vo.getEnd());
		
		if (searchTy != null) {
			if (searchTy.equals("condition")) {
				vo.setConditionUri();
			} else {
				vo.setTagUri();
			}
		}
		vo.setOrderUri();
		
		log.info("vo.getUri() " + vo.getUri());
		
		reviewMap.put("contentId", Integer.parseInt(contentId));
		reviewMap.put("start", vo.getStart());
		reviewMap.put("end", vo.getEnd());
		
		if(value == null) {
			reviewMap.put("value", "upDate");
		}else {
			reviewMap.put("value", value);
		}
		
		log.info("value : " + value);
		
		reviews = reviewService.getReviewSearchData(reviewMap);
		
		log.info(nowPage);
		log.info("reviewTotal " + reviewTotal);
		log.info("reviews " + reviews);
		
		m.addAttribute("search", vo);
		m.addAttribute("paging", pvo);
		m.addAttribute("lists", reviews);
		
	}

}
