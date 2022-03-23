package com.spring.project.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.utill.PagingVO;

public interface PostXMLMapper {
	
	public Integer getCount(SearchVO search);
	
	public List<PostVO> getSupportPostList(@Param("search") SearchVO search, @Param("pvo") PagingVO pvo);
	public List<PostVO> getSupportSearch(@Param("search") SearchVO search, @Param("pvo") PagingVO pvo);
	
	public PostVO getContents(Integer Post_id);

}
