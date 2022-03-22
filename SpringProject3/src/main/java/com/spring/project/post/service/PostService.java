package com.spring.project.post.service;

import java.util.List;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.utill.PagingVO;

public interface PostService {
	
	public Integer getCount(SearchVO search);
	
	public List<PostVO> getSupportPostList(SearchVO search, PagingVO pvo);
	public List<PostVO> getSupportSearch(SearchVO search, PagingVO pvo);

}
