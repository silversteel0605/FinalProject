package com.spring.project.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.camping.DTO.CampingImgVO;
import com.spring.project.review.DTO.CampingReviewDTO;
import com.spring.project.review.service.CampingReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class CampingReviewRestController {
	
	@Autowired
	CampingReviewService service;
	
	@PutMapping(value = "/review")
	public List<CampingReviewDTO> reviewUpdata(Model m, @RequestBody CampingReviewDTO r_dto) {
		
		service.reviewUpdate(r_dto);
		
		List<CampingReviewDTO> reviews = service.getReviewAllInfoList(Integer.toString(r_dto.getContentId()));
		
		log.info("수정 테스트 성공");
		
		return reviews;
	}
	
	@DeleteMapping(value = "/review")
	public List<CampingReviewDTO> reviewDelete(Model m, @RequestBody String contentId, @RequestBody String reviewId) {
		
		service.deleteReviewData(Integer.parseInt(reviewId));
		
		List<CampingReviewDTO> reviews = service.getReviewAllInfoList(contentId);
		
		log.info("삭제 테스트 성공");
		
		return reviews;
	}

	@PostMapping(value = "/review")
	public List<CampingReviewDTO> reviewSave(Model m, CampingReviewDTO r_dto) {
		
		log.info(r_dto);
		
		service.initReviewData(r_dto);

		List<CampingReviewDTO> reviews = service.getReviewAllInfoList(Integer.toString(r_dto.getContentId()));
		
		log.info("저장 테스트 성공");
		
		return reviews;
	}
}
