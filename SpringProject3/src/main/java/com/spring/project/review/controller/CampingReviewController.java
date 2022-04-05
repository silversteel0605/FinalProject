package com.spring.project.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.camping.DTO.SearchVO;
import com.spring.project.review.DTO.CampingReviewDTO;
import com.spring.project.review.service.CampingReviewService;
import com.spring.project.utill.PagingVO;
import com.spring.project.utill.WordChange;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CampingReviewController {
	
	@Autowired
	CampingReviewService service;
	
	private static int cntPerPage = 9;
	
	@RequestMapping(value = "/reviewSort", method = RequestMethod.GET)
	public String reviewSort(Model m, @RequestParam(value="value") String value, @RequestParam(value="contentId") String contentId) {
		
		String type = "3"; 
		
		m.addAttribute("value", value);
		m.addAttribute("contentId", contentId);
		m.addAttribute("type", type);
		
		return "redirect:CampInfo#tab03";
	}
	
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Model m, @RequestParam(value="type", required=false) String type, @RequestParam(value="reviewId", required=false) String reviewId, @RequestParam(value="contentId") String contentId) {
		
		CampingReviewDTO r_dto = new CampingReviewDTO();
		
		try {
			int r_id = Integer.parseInt(reviewId);
			r_dto = service.getReviewInfo(r_id);
			WordChange wc = new WordChange();
			
			log.info(wc.javaScriptSpace(r_dto.getTitle()));
			log.info(wc.javaScriptSpace(r_dto.getReview()));
			
			r_dto.setTitle(wc.javaScriptSpace(r_dto.getTitle()));
			r_dto.setReview(wc.javaScriptSpace(r_dto.getReview()));
			
			m.addAttribute("review_id", r_id);
			
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
		
		service.reviewUpdate(r_dto);
		
		log.info("updata : " + r_dto);
		
		m.addAttribute("reviewId", r_dto.getReview_id());
		
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
		
		return "redirect:CampInfo#tab03";
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
		
		return "redirect:CampInfo#tab03";
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
	
	@RequestMapping(value = "/reviewGreate", method = RequestMethod.GET)
	public String reviewGreate(Model m, String reviewId) {
		
		int r_id = Integer.parseInt(reviewId);
		
		service.reviewClickNumUp(r_id);
		CampingReviewDTO r_dto = service.getReviewInfo(r_id);
		
		log.info(r_dto);
		m.addAttribute("r_dto", r_dto);
		
		return "review_paragraph";
	}
}
