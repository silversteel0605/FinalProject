package com.spring.project.post.service;

import java.util.List;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.utill.PagingVO;

public interface PostService {
	
	public Integer getCount(Integer board_class);
	
	public List<PostVO> getSupportPostList(Integer board_class, Integer category, PagingVO pvo);
	public List<PostVO> getSupportSearch(SearchVO search);

	public List<PostVO> getAllSupportPost(Integer board_class, Integer nowPage, Integer cntPerPage);
	public List<PostVO> getSupportSearchResult(String searchKeyword, String searchByWhat, Integer board_class);
	
	public List<PostVO> getAllSupportPostWithCategory(Integer board_class, Integer categoryName);
	public List<PostVO> getSupportSearchResultWhitCategory(String searchKeyword, String searchByWhat, Integer board_class, Integer categoryName);
	
}
