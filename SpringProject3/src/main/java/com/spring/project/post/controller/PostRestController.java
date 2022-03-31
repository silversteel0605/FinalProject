package com.spring.project.post.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.post.dto.CommentVO;
import com.spring.project.post.dto.PostVO;
import com.spring.project.post.service.PostService;

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
		comment.setMember_id((String)session.getAttribute("member_id"));
		
		// Integer groupNum = postService.getGroupnum();
		
		log.info("수정 후: " + comment);
		postService.addComment(comment);
		
		return comment;
	}
	
}














