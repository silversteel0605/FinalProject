package com.spring.project.camping.controller;

import java.io.IOException;
import java.util.List;

import org.jdom2.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.camping.DTO.CampingReviewDTO;
import com.spring.project.camping.DTO.CampingVO;
import com.spring.project.camping.DTO.CampingSearchVO;
import com.spring.project.camping.service.CampingService;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CampingController {
	
	@Autowired
	CampingService service;
	
	private static int cntPerPage = 9;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model m, @RequestParam(value="nowPage", required=false)String nowPage, CampingSearchVO vo)  throws  IOException, JDOMException {
		controlling(m, nowPage, vo);
		return "search";
	}

	
	@RequestMapping(value = "/TempCampInfo", method = RequestMethod.GET)
	public String info(Model m, @RequestParam(value="contentId") String contentId) throws IOException, JDOMException {
		service.addViews(contentId);
		CampingVO info = service.getInfo(contentId);
		
		List<CampingReviewDTO> reviewInfoList = service.getReviewAllInfoList(contentId);
		
		m.addAttribute("info", info);
		m.addAttribute("reviewInfoList", reviewInfoList);
		
		System.out.println(reviewInfoList);
		System.out.println(info);
		
		return "camping_index";
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
		log.info("�������");
		
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
	public String map(Model m, @RequestParam(value="nowPage", required=false)String nowPage, CampingSearchVO vo) {
		controlling(m, nowPage, vo);
		return "map-search";
	}
	
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String init() {
		return "init";
	}
	
	public void controlling(Model m, @RequestParam(value="nowPage", required=false)String nowPage, CampingSearchVO vo) {
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
