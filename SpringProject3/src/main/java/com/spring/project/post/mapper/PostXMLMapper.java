package com.spring.project.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.project.post.dto.CommentVO;
import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.utill.PagingVO;

public interface PostXMLMapper {
	
	public Integer getCount(SearchVO search);
	
	public List<PostVO> getPostList(@Param("search") SearchVO search, @Param("pvo") PagingVO pvo);
	public List<PostVO> getPostSearch(@Param("search") SearchVO search, @Param("pvo") PagingVO pvo);
	
	public PostVO getContents(Integer post_id);
	public void deletePost(Integer post_id);
	
	public void addComment(CommentVO comment);
	public List<PostVO> getComments(PostVO post);
	
	public void addPost(PostVO post);
	
	// 관리자에서 불러오기
	public PostVO[] getAllPost(PostVO vo);
	
	public int getAllCounts();
}
