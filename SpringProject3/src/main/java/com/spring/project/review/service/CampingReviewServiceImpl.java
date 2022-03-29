package com.spring.project.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.review.DTO.CampingReviewDTO;
import com.spring.project.review.mapper.CampingReviewDataMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CampingReviewServiceImpl implements CampingReviewService{
	
	@Autowired
	CampingReviewDataMapper dataMapper;
	
	@Override
	public List<CampingReviewDTO> getReviewAllInfoList(String contentId) {
		return dataMapper.getReviewAllInfoList(contentId);
	}
	
	@Override
	public void initReviewData(CampingReviewDTO c_dto) {
		dataMapper.initReviewData(c_dto);
	}

	@Override
	public CampingReviewDTO getReviewInfo(int reviewId) {
		return dataMapper.getReviewInfo(reviewId);
	}

	@Override
	public void reviewClickNumUp(int reviewId) {
		dataMapper.reviewClickNumUp(reviewId);
	}
	
	@Override
	public void reviewUpdate(CampingReviewDTO c_dto) {
		dataMapper.reviewUpdate(c_dto);
	}
	
	@Override
	public int getReviewAllPageCnt() {
		return dataMapper.getReviewAllPageCnt();
	}
	
	@Override
	public List<CampingReviewDTO> getReviewSearchData(Map<String, Object> reviewMap) {
		return dataMapper.getReviewSearchData(reviewMap);
	}
	
	@Override
	public int getReviewCreateReviewID() {
		return dataMapper.getReviewCreateReviewID();
	}
	
	@Override
	public void deleteReviewData(int reviewId) {
		dataMapper.deleteReviewData(reviewId);
	}
	
	@Override
	public List<CampingReviewDTO> getSortReviewDatas(Map<String, Object> reviewMap) {
		return dataMapper.getSortReviewDatas(reviewMap);
	}

}
