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

import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.camping.service.CampingService;
import com.spring.project.review.DTO.CampingReviewDTO;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CampingController {
	
	@Autowired
	CampingService service;
	
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
	public String info(Model m, @RequestParam(value="contentId") String contentId, @RequestParam(value="nowPage", required=false)String nowPage, SearchVO vo, @RequestParam(value="type", required=false)String type) throws IOException, JDOMException {

		service.addViews(contentId);
		CampingVO info = service.getInfo(contentId);
		
		List<CampingReviewDTO> reviewInfoList = service.getReviewAllInfoList(contentId);

		type = type != null ? type :"1";
		
		log.info(type);
		
		m.addAttribute("info", info);
		m.addAttribute("reviewInfoList", reviewInfoList);
		m.addAttribute("type", type);
		
		reviewControlling(m, nowPage, contentId, vo);		
		
		return "camping_index";
	}
	
	@RequestMapping(value = "/review_write_updata", method = RequestMethod.GET)
	public String reviewUpdata(Model m, @RequestParam(value="type") int type, @RequestParam(value="reviewId") String reviewId, @RequestParam(value="contentId") String contentId) {
		
		int r_id = Integer.parseInt(reviewId);
		
		log.info(type);
		log.info(contentId);
		log.info(reviewId);
		
		CampingReviewDTO c_dto = service.getReviewInfo(r_id);
		
		m.addAttribute("type", type);
		m.addAttribute("contentId", contentId);
		m.addAttribute("reviewId", reviewId);
		m.addAttribute("c_dto", c_dto);
		
		return "review_write";
	}

	@RequestMapping(value = "/review_write", method = RequestMethod.GET)
	public String review(Model m, @RequestParam(value="contentId") String contentId) {
		
		log.info(contentId);
		
		m.addAttribute("contentId", contentId);
		
		return "review_write";
	}
	
	@RequestMapping(value = "/reviewSave", method = RequestMethod.GET)
	public String reviewSave(Model m, CampingReviewDTO c_dto) {
		
		log.info(c_dto);
		
		service.initReviewData(c_dto);
		log.info("정상수행");
		
		return "search";
	}
	@RequestMapping(value = "/reviewViewer", method = RequestMethod.GET)
	public String reviewViewer(Model m, String reviewId) {
		
		int r_id = Integer.parseInt(reviewId);
		
		service.reviewClickNumUp(r_id);
		CampingReviewDTO c_dto = service.getReviewInfo(r_id);
		
		log.info(c_dto);
		m.addAttribute("c_dto", c_dto);
		
		return "/review_paragraph";
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
	
	public void reviewControlling(Model m, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="contentId") String contentId, SearchVO vo) {
		
		int reviewTotal;
		List<CampingReviewDTO> reviews;
		PagingVO pvo;
		Map<String, Object> reviewMap = new HashMap();
		
		reviewTotal = service.getReviewAllPageCnt();
		
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
		
		reviews = service.getReviewSearchData(reviewMap);
		
		log.info(nowPage);
		log.info("reviewTotal " + reviewTotal);
		log.info("reviews " + reviews);
		
		m.addAttribute("search", vo);
		m.addAttribute("paging", pvo);
		m.addAttribute("lists", reviews);
		
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
