package com.spring.project.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.post.dto.PostVO;
import com.spring.project.post.service.PostService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest")
public class PostRestController {

	@Autowired
	PostService postService;
	
	@GetMapping(value = "/individual", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<PostVO> individualPage(String member_id) {
		List<PostVO> postList = postService.getIndividual(member_id);
		return postList;
	}
	
	@PutMapping(value = "/main_paragraph", produces = MediaType.APPLICATION_JSON_VALUE)
	public Integer report(Integer post_id) {
		Integer report = postService.getReport(post_id);
		postService.addReport(post_id, report);
		report = postService.getReport(post_id);
		return report;
	}
	
}














