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
	public Integer getCount( SearchVO search) {
		return postMapper.getCount(search);
	}
	
	@Override
	public List<PostVO> getSupportPostList(SearchVO search, PagingVO pvo) {
		
		Integer startNum = pvo.getTotal() - (pvo.getCntPerPage() * pvo.getNowPage());
		Integer endNum = pvo.getTotal() - (pvo.getCntPerPage() * (pvo.getNowPage() - 1));
		pvo.setStart(startNum);
		pvo.setEnd(endNum);
		
		return postMapper.getSupportPostList(search, pvo);
	}
	
	@Override
	public List<PostVO> getSupportSearch(SearchVO search, PagingVO pvo) {
		
		Integer startNum = pvo.getTotal() - (pvo.getCntPerPage() * pvo.getNowPage());
		Integer endNum = pvo.getTotal() - (pvo.getCntPerPage() * (pvo.getNowPage() - 1));
		pvo.setStart(startNum);
		pvo.setEnd(endNum);
		
		return postMapper.getSupportSearch(search, pvo);
	}
	
	@Override
	public PostVO getContents(Integer post_id) {
		return postMapper.getContents(post_id);
	}
}







