package com.spring.project.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.post.dto.CommentVO;
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
	public List<PostVO> getPostList(SearchVO search, PagingVO pvo) {
		
		Integer startNum = pvo.getTotal() - (pvo.getCntPerPage() * pvo.getNowPage());
		Integer endNum = pvo.getTotal() - (pvo.getCntPerPage() * (pvo.getNowPage() - 1));
		pvo.setStart(startNum);
		pvo.setEnd(endNum);
		
		return postMapper.getPostList(search, pvo);
	}
	
	@Override
	public List<PostVO> getPostSearch(SearchVO search, PagingVO pvo) {
		
		Integer startNum = pvo.getTotal() - (pvo.getCntPerPage() * pvo.getNowPage());
		Integer endNum = pvo.getTotal() - (pvo.getCntPerPage() * (pvo.getNowPage() - 1));
		pvo.setStart(startNum);
		pvo.setEnd(endNum);
		
		return postMapper.getPostSearch(search, pvo);
	}
	
	@Override
	public PostVO getContents(Integer post_id) {
		return postMapper.getContents(post_id);
	}
	
	@Override
	public void deletePost(Integer post_id) {
		postMapper.deletePost(post_id);
	}
	
	@Override
	public Integer increaseViews(PostVO post) {
		log.info("증가 전 조회수: " + post.getViews());
		post.setViews(post.getViews() + 1);
		log.info("증가 후 조회수: " + post.getViews());
		postMapper.increaseViews(post);
		return post.getViews();
	}
	
	@Override
	public List<PostVO> getComments(PostVO post) {
		return postMapper.getComments(post);
	}
	
	public Integer getCommentsEA(Integer post_id) {
		return postMapper.getCommentsEA(post_id);
	};
	
	@Override
	public void addPost(PostVO post) {
		postMapper.addPost(post);
	}
	
	@Override
	public void editPost(PostVO post) {
		postMapper.editPost(post);
	}
	
	@Override
	public List<PostVO> getIndividual(String id) {
		return postMapper.getIndividual(id);
	}
	
	@Override
	public void addReport(Integer post_id, Integer report) {
		Integer updateNum = report + 1;
		
		postMapper.addReport(post_id, updateNum);
	}
	
	@Override
	public Integer getReport(Integer post_id) {
		return postMapper.getReport(post_id);
	}
	
	public PostVO[] getAllPost(PostVO vo) {
		return postMapper.getAllPost(vo);
	}

	@Override
	public int getAllCounts() {
		return postMapper.getAllCounts();
	}
}







