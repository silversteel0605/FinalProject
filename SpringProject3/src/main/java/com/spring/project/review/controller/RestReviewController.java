package com.spring.project.review.controller;

import org.apache.ibatis.type.BaseTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.review.DTO.CampingReviewDTO;
import com.spring.project.review.service.CampingReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping(value="/rest")
public class RestReviewController {
	
	@Autowired
	CampingReviewService service;
	
	@GetMapping(value="/manager/review")
	public CampingReviewDTO[] getReviews(CampingReviewDTO dto) {
		dto.calcStartEnd(10);
		CampingReviewDTO[] dtos = service.getAllReviews(dto);
		log.info(dtos[0].getReg_date());
		if(dtos.length > 0) {
			dtos[0].setTotal(service.getReviewAllPageCnt());
		}
		return dtos;
	}
}
