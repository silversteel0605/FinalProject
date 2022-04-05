package com.spring.project.post.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.post.dto.CommentVO;
import com.spring.project.post.dto.PostVO;
import com.spring.project.post.dto.SearchVO;
import com.spring.project.post.service.PostService;
import com.spring.project.utill.PagingVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class PostRestController {

	@Autowired
	PostService postService;

	@PostMapping(value = "/main_paragraph", produces = MediaType.APPLICATION_JSON_VALUE)
	public CommentVO comments(HttpServletRequest request, @RequestBody CommentVO comment) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		log.info("수정 전: " + comment);
		comment.setMember_id((String)session.getAttribute("currentUser"));
		
		// Integer groupNum = postService.getGroupnum();
		
		log.info("수정 후: " + comment);
		postService.addComment(comment);
		
		return comment;
	}
	
	@GetMapping(value="/rest/manager/post")
	public List<PostVO> getAllPost( String nowPage, SearchVO search) {
		Integer total = postService.getCount(search);
		PagingVO pvo = new PagingVO(total, Integer.parseInt(nowPage), 10);
		log.info(search);	
		List<PostVO> list = postService.getPostList(search, pvo);
		if(list.size() > 0) {
			list.get(0).setTotal(total);
		}
		
		return list;
	}
	
}














