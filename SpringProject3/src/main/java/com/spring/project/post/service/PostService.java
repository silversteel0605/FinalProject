package com.spring.project.post.service;

import java.util.List;

import com.spring.project.post.dto.CommentVO;
import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.utill.PagingVO;

public interface PostService {
	
	public Integer getCount(SearchVO search);
	
	public List<PostVO> getPostList(SearchVO search, PagingVO pvo);
	public List<PostVO> getPostSearch(SearchVO search, PagingVO pvo);
	
	public PostVO getContents(Integer post_id);
	public void deletePost(Integer post_id);
	
	public void addComment(CommentVO comment);
	
}
