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
import com.spring.project.utill.WordChange;

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
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Model m, @RequestParam(value="type", required=false) String type, @RequestParam(value="reviewId", required=false) String reviewId, @RequestParam(value="contentId") String contentId) {
		
		CampingReviewDTO r_dto = new CampingReviewDTO();
		
		try {
			int r_id = Integer.parseInt(reviewId);
			r_dto = service.getReviewInfo(r_id);
			WordChange wc = new WordChange();
			
			log.info(wc.javaScriptSpace(r_dto.getTitle()));
			log.info(wc.javaScriptSpace(r_dto.getContentValue()));
			
			r_dto.setTitle(wc.javaScriptSpace(r_dto.getTitle()));
			r_dto.setContentValue(wc.javaScriptSpace(r_dto.getContentValue()));
			
			m.addAttribute("reviewId", r_id);
			
			log.info("수정페이지");
		} catch (Exception e) {
			log.info(r_dto);
			log.info("생성페이지");
		} finally {
			log.info(type);
			log.info(contentId);
			log.info(reviewId);
			
			m.addAttribute("r_dto", r_dto);
			m.addAttribute("type", Integer.parseInt(type));
			m.addAttribute("contentId", contentId);
		}
		
		return "review_write";
	}
	
	@RequestMapping(value = "/reviewUpdata", method = RequestMethod.GET)
	public String reviewUpdata(Model m, @RequestParam(value="reviewId", required=false) String reviewId, CampingReviewDTO r_dto) {
		/*
		r_dto.setTitle(new WordChange().javaScriptSpace(r_dto.getTitle()));
		r_dto.setContentValue(new WordChange().javaScriptSpace(r_dto.getContentValue()));
		*/
		
		service.reviewUpdate(r_dto);
		m.addAttribute("reviewId",r_dto.getReviewId());
		
		return "redirect:reviewViewer";
	}
	
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.GET)
	public String reviewDelete(Model m, @RequestParam(value="reviewId", required=false) String reviewId, @RequestParam(value="contentId", required=false) String contentId) {
		
		log.info(reviewId);
		log.info(contentId);
		
		service.deleteReviewData(Integer.parseInt(reviewId));
		
		log.info("정상수행");
		
		String type = "3"; 
		
		m.addAttribute("contentId", contentId);
		m.addAttribute("type", type);
		
		return "redirect:TempCampInfo#tab03";
	}

	@RequestMapping(value = "/reviewSave", method = RequestMethod.GET)
	public String reviewSave(Model m, CampingReviewDTO r_dto) {
		
		log.info(r_dto);
		
		service.initReviewData(r_dto);
		
		log.info("정상수행");
		
		String type = "3"; 
		
		m.addAttribute("r_dto");
		m.addAttribute("contentId", r_dto.getContentId());
		m.addAttribute("type", type);
		
		return "redirect:TempCampInfo#tab03";
	}
	
	@RequestMapping(value = "/reviewViewer", method = RequestMethod.GET)
	public String reviewViewer(Model m, String reviewId) {
		
		int r_id = Integer.parseInt(reviewId);
		
		service.reviewClickNumUp(r_id);
		CampingReviewDTO r_dto = service.getReviewInfo(r_id);
		
		log.info(r_dto);
		m.addAttribute("r_dto", r_dto);
		
		return "review_paragraph";
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
