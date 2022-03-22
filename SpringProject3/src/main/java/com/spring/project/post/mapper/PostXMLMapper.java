package com.spring.project.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.utill.PagingVO;

public interface PostXMLMapper {
	
	public Integer getCount(Integer board_class);
	
	public List<PostVO> getSupportPostList(@Param("board_class") Integer board_class, @Param("category") Integer category, PagingVO pvo);
	public List<PostVO> getSupportSearch(SearchVO search);

	public List<PostVO> getAllSupportPost(@Param("board_class") Integer board_class, @Param("page") Integer page, @Param("plusPage") Integer plusPage);
	public List<PostVO> getAllSupportSearchResult(@Param("searchKeyword") String searchKeyword, @Param("board_class") Integer board_class);
	public List<PostVO> getSpecificSupportSearchResult(@Param("searchKeyword") String searchKeyword, @Param("searchByWhat") String searchByWhat, @Param("board_class") Integer board_class);
	
	public List<PostVO> getAllSupportPostWithCategory(@Param("board_class") Integer board_class, @Param("categoryName") Integer categoryName);
	public List<PostVO> getAllSupportPostWithCategoryWithCategory(@Param("searchKeyword") String searchKeyword, @Param("board_class")  Integer board_class, @Param("categoryName") Integer categoryName);
	public List<PostVO> getSpecificSupportPostWithCategoryWithCategory(@Param("searchKeyword") String searchKeyword, @Param("searchByWhat") String searchByWhat, @Param("board_class")  Integer board_class, @Param("categoryName") Integer categoryName);
	
}
