package com.spring.project.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.post.mapper.PostXMLMapper;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostXMLMapper postMapper;

	@Override
	public Integer getCount(Integer board_class) {
		return postMapper.getCount(board_class);
	}
	
	@Override
	public List<PostVO> getSupportPostList(Integer board_class, Integer category, PagingVO pvo) {
		return postMapper.getSupportPostList(board_class, category, pvo);
	}
	
	@Override
	public List<PostVO> getSupportSearch(SearchVO search) {
		return postMapper.getSupportSearch(search);
	}
	
	
	@Override
	public List<PostVO> getAllSupportPost(Integer board_class, Integer nowPage, Integer cntPerPage) {
		
		Integer page = ((nowPage - 1) * 10) + 1;
		Integer plusPage = page + cntPerPage;
		
		List<PostVO> postList = postMapper.getAllSupportPost(board_class, page, plusPage);
		return postList;
	}
	
	String category;
	List<PostVO> searchList;
	
	@Override
	public List<PostVO> getSupportSearchResult(String searchKeyword, String searchByWhat, Integer board_class) {
		
		log.info("searchKeyword on service: " + searchKeyword);
		log.info("searchByWhat on service: " + searchByWhat);
		log.info("board_class on service: " + board_class);
		
		if (searchByWhat.equals("전체")) {
			return searchList = postMapper.getAllSupportSearchResult(searchKeyword, board_class);
		} else {
			return searchList = postMapper.getSpecificSupportSearchResult(searchKeyword, searchByWhat, board_class);
		} 
	}

	@Override
	public List<PostVO> getAllSupportPostWithCategory(Integer board_class, Integer categoryName) {
		return postMapper.getAllSupportPostWithCategory(board_class, categoryName);
	}
	
	@Override
	public List<PostVO> getSupportSearchResultWhitCategory(String searchKeyword, String searchByWhat,
			Integer board_class, Integer categoryName) {
		log.info("service: " + searchKeyword);
		log.info("service: " + searchByWhat);
		log.info("service: " + board_class);
		log.info("service: " + categoryName);
		
		if (searchByWhat.equals("전체")) {
			return postMapper.getAllSupportPostWithCategoryWithCategory(searchKeyword, board_class, categoryName);
		} else {
			return postMapper.getSpecificSupportPostWithCategoryWithCategory(searchKeyword, searchByWhat, board_class, categoryName);
		} 
		
	}

}







